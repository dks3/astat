class PeopleController < ApplicationController
  def edit
    @person = Person.includes(:positions).find(params[:id])
  end

  def show
  end

  def new
    @person = Person.new
    @person.build_city
    @person.build_sip_user
    @person.positions << Position.new
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
