FROM ruby:2.3.1

RUN mkdir /specs

WORKDIR /specs

COPY vpc_spec.rb /specs/ 

RUN gem install cloudformation_rspec

ENTRYPOINT ["rspec"]

CMD ["vpc_spec.rb"]


