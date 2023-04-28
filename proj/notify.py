import os
import smtplib

smtp_server = "smtp.gmail.com"
smtp_port = 587 # port for TLS
sender_email = "1905032cse@cit.edu.in"
sender_password = "citmailid"
recipient_email = "abs2014114@gmail.com"


def find_size(source):
    total_size = os.path.getsize(source)
    for item in os.listdir(source):
        itempath = os.path.join(source, item)
        if os.path.isfile(itempath):
            total_size += os.path.getsize(itempath)
        elif os.path.isdir(itempath):
            total_size += find_size(itempath)
    return total_size


current_path = __file__

current_path = current_path.split('/');
current_path = current_path[:-1]
current_path = "/".join(current_path)

backup_file = open(os.path.join(current_path,"backup_config.sh"),"r");




file_contents = list(backup_file.read().split('\n'));

file_contents = file_contents[1:-1];

print(file_contents)

backup_dir = [];

for command in file_contents:
    parts = command.split(' ');
    backup_dir.append(parts[-1]);
    

mail_content = open("mail_content.txt","w");

for directory in backup_dir:
    # print(f"The directory {directory} has size {find_size(directory)/1024} kB");
    mail_content.write(f"The directory {directory} has size {find_size(directory)/1024} kB");

mail_content.close();

temp = open("mail_content.txt","r");
text_to_mail = temp.read()


# create a message
message = f"""\
Subject: Hello from Python

Here you can find the file system description
{text_to_mail}."""

# send the email
try:
    # log in to the SMTP server and set up a secure connection
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()
    server.login(sender_email, sender_password)

    # send the email
    server.sendmail(sender_email, recipient_email, message)
    print("Email sent successfully!")
except Exception as e:
    print("Error sending email:", e)
finally:
    # close the SMTP server connection
    server.quit()    
        	
