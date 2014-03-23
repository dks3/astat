class PeopleController < ApplicationController
  def edit
    @person = Person.includes(:positions).find(params[:id])
  end

  def show
    @person = Person.includes(:sip_user, :city).find(params[:id])

    @cdr = Cdr.all

    @time1 = Time.now-1.months
    @time2 = Time.now

    if (params[:date1] && params[:date2])
      @time1 = Time.new(params[:date1][:year], params[:date1][:month], params[:date1][:day], 0, 0, 0, "+00:00")
      @time2 = Time.new(params[:date2][:year], params[:date2][:month], params[:date2][:day],23,59,59, "+00:00")
    end

    if (params[:time1] && params[:time2])
      @time1 = Time.new(params[:time1][0,4], params[:time1][5,2], params[:time1][8,2], 0, 0, 0, "+00:00")
      @time2 = Time.new(params[:time2][0,4], params[:time2][5,2], params[:time2][8,2],23,59,59, "+00:00")
    end

    @sort_p = :calldate
    @sort_p = params[:sort] if (params[:sort])
    @direction = :asc
    @direction = params[:direction] if (params[:direction])

    @cdr = @cdr.where(calldate: @time1..@time2)
    @cdr = @cdr.order("#{params[:sort]} #{params[:direction]}") if params[:sort]
    @cdr
  end

  def new
    @person = Person.new
    @person.build_city
    @person.build_sip_user
    @position = Position.new
    if (params[:subdivision_id])
      @position.subdivision_id= params[:subdivision_id]
    end
    @person.positions << @position
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to subdivisions_path, notice: 'Sip пользователь создан.' }
      else
        format.html { render action: 'new' }
      end
    end

  end

  def update
   # render text: params
    @person = Person.includes(:positions).find(params[:id])
      respond_to do |format|
        if @person.update(person_params)
          format.html { redirect_to subdivisions_path, notice: 'Sip сохранен.' }
        else
          format.html { render action: 'edit' }
        end
      end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to subdivisions_path, notice: "Пользователь удален"
  end

  private
  def person_params
    params.require(:person).permit(:surname, :firstname, :patronymic, positions_attributes: [:id, :person_id, :function_id, :subdivision_id, :_destroy], city_attributes: [:id, :number, :file, :channels, :autoanswer, :_destroy],  sip_user_attributes: [:id, :name, :callerid, :username, :mailbox, :host, :nat, :ntype, :accountcode, :amaflags, :callgroup, :cancallforward, :canreinvite, :context, :defaultip, :dtmfmode, :fromuser, :fromdomain, :insecure, :language, :md5secret, :deny, :permit, :mask, :musiconhold, :pickupgroup, :qualify, :regexten, :restrictcid, :rtptimeout, :rtpholdtimeout, :secret, :setvar, :disallow, :allow, :fullcontact, :ipaddr, :port, :regserver, :regseconds, :lasms, :podrazdelenie, :rus_name, :zvanie, :allow_city_in, :allow_city_out, :telephon_type, :full_name, :prio_zv, :prio_podr, :vip, :_destroy])
  end
end
