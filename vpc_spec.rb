describe 'vpc_template' do
  let(:template_json) { File.read('fixtures/vpc.json') }
  let(:stack) {
    template_body: template_json,
    parameters: {
      "VpcCidr" => cidr,
    }
  }

  it 'is valid' do
    expect(template_json).to be_valid
  end

  context 'with a valid cidr' do
    let(:cidr) { "10.0.0.0/16" }

    it 'creates a vpc' do
      expect(stack).to contain_in_change_set("AWS::EC2::VPC", "vpc")
    end
  end

  context 'with invalid cidr' do
    let(:cidr) { "1.1.1.0/16" }

    it 'fails to create a change set' do
      expect(stack).to have_change_set_failed
    end
  end
end

