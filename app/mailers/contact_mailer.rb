class ContactMailer < ApplicationMailer
  default from: "frima31985@frima31985.com"   # 送信元アドレス

  def received_email(contact)
    @contact = contact
    mail(:to => contact.email, :subject => 'お問い合わせを承りました')
  end
end
