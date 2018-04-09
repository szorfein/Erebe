# example of Encryptor class:
# https://github.com/evertrue/encrypted_cookie/blob/master/lib/encrypted_cookie/encryptor.rb
class Encryptor

    def self.initialize
    end

    def self.encrypt
        iv = Base64.decode64("kT+uMuPwUk2LH4cFbK0GiA==")
        key = "183bf151ca660cf9d58181e0af126d89"
        cipher = OpenSSL::Cipher.new('aes-256-ctr')
        cipher.encrypt
        cipher.key = key
        cipher.iv = iv
        text = cipher.update("test") + cipher.final
        encrypted_text = Base64.strict_encode64(text)
        puts("++ #{encrypted_text} ++")
        return encrypted_text
    end

    def self.decrypt
    end

end
