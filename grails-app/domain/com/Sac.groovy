package com
import com.springSecurity.User

class Sac {

	String assunto
	String mensagem
	String email

    static constraints = {
    	//assunto (blank:false)
    	mensagem(blank:false)
    	email(email:true)
        assunto(nullable:true)
    	//assunto(inList:["Elogio","Dúvida","Sugestão","Reclamação"])

    }
}
