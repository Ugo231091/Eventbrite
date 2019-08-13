class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://eventbright-carsa.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_attendee_email(event, attendee)
    @event = event
  	@admin = @event.admin
  	@attendee = attendee
  	@url = "https://eventbright-carsa.herokuapp.com//events/#{event.id}"

  	mail(to: @admin.email, subject: 'A new registration for your event')  
  end
end
