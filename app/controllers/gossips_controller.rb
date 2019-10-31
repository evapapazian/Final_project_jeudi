class GossipsController < ApplicationController

 before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]



  def index
    @gossip = Gossip.all
    @user = User.all
  end




  def show
    @gossip = Gossip.find(params[:id])
    @user = User.all

  end



  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end


  def create
    # Méthode qui créé un potin à partir du contenu du formulaircite de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
 
  @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: session[:user_id]) # avec xxx qui sont les données obtenues à partir du formulaire

  if @gossip.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
       @gossips=Gossip.all
      redirect_to gossips_path
  else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  render 'new'
  end

  end



  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  @gossip = Gossip.find(params[:id])
  end



  def update

     @gossip = Gossip.find(params[:id])
     post_params = params.permit(:title, :content)

  unless compare_user(session[:user_id], @gossip.user_id) == false
     if @gossip.update(title: params[:title], content: params[:content])
     @gossips=Gossip.all
     redirect_to gossips_path

     else
     render :edit
  end  
     end
     redirect_to gossips_path


end


  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    

    @gossip = Gossip.find(params[:id])

   unless compare_user(session[:user_id], @gossip.user_id) == false
      if  @gossip.destroy
       redirect_to gossips_path 
       else 
        render :show
  end
end 
  
end



end




