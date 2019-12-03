Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C977652995
	for <meta-arago@arago-project.org>;
	Tue,  3 Dec 2019 01:25:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB31NZHp097826
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 19:23:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575336215;
	bh=dDtr+Jput6RsMOuv5zH6RDDBNejMrq0wlOYbG3DlWTY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uAx9ko3as1z7TdX+Am6VxVYsY4OQFi1fznWNRFAHv34ab6jkbHNHcqlATxGCNtBfj
	5CLR/ghElS9mOBzC8tBLEk9DCFv4kvAoVMOeeUrlugwwecFAhtKaVa9C67vqxWymzD
	fu3viG9+y/k9PsYg29GtGjRrhoKwyajmcyxpzlig=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB31NY6W115689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 19:23:35 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 2 Dec 2019 19:23:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 2 Dec 2019 19:23:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB31NYsS063611;
	Mon, 2 Dec 2019 19:23:34 -0600
Date: Mon, 2 Dec 2019 20:23:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20191203012334.GF24609@beryl>
References: <20191202220137.12783-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191202220137.12783-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] armnn:ArmnnExample: Fix exception for '--help' command line option
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2019 01:25:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Wrong list - this doesn't seem like a patch against meta-arago...


On Mon, Dec 02, 2019 at 05:01:37PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  tests/ArmnnExamples/ArmnnExamples.cpp | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
> index c10a4fc0..660106c0 100644
> --- a/tests/ArmnnExamples/ArmnnExamples.cpp
> +++ b/tests/ArmnnExamples/ArmnnExamples.cpp
> @@ -213,6 +213,18 @@ namespace
>    // Configure boost::program_options for command-line parsing and validation.
>    namespace po = boost::program_options;
>  
> +  bool CheckOption(const po::variables_map& vm, const char* option)
> +  {
> +    // Check that the given option is valid.
> +    if (option == nullptr)
> +    {
> +        return false;
> +    }
> +
> +    // Check whether 'option' is provided.
> +    return vm.find(option) != vm.end();
> +  }
> +
>    template<typename T, typename TParseElementFunc>
>    std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
>    {
> @@ -647,6 +659,14 @@ int main(int argc, const char* argv[])
>      try
>      {
>        po::store(po::parse_command_line(argc, argv, desc), vm);
> +      if (CheckOption(vm, "help") || argc <= 1)
> +      {
> +            std::cout << "Executes a neural network model using the provided video clip, or input camera stream. " << std::endl;
> +            std::cout << "Runs many consecutive inferences and shows classification labels on display, in real-time." << std::endl;
> +            std::cout << std::endl;
> +            std::cout << desc << std::endl;
> +            return EXIT_SUCCESS;
> +      }
>        po::notify(vm);
>      }
>      catch (const po::error& e)
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

