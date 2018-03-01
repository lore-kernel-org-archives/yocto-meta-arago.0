Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 33086529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:20:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JJgLu026491
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:19:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931982;
	bh=p50y9qQpPqnhkuwxoj5SHdB1pceqfBJB0/vgl/cY0dE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o3Z2Rv8472OS2CPU+ZqzKCpTR/kJCUkRdkE+oZ7MZD9Sftx8lln0lOXbL9yk5LXU3
	cbrfsifFIuAmAX1K5UUDkOzE4mMZbMAKVaaJgy/Vj4liFGM43irjOrmfD//XVZTOvb
	346X3uMrEeRCJI5RuBFgJdfyiQh/1/gxqMlb2+9Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JJgG9019332
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:19:42 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:19:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:19:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JJf9h023963;
	Thu, 1 Mar 2018 13:19:41 -0600
Date: Thu, 1 Mar 2018 14:19:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180301191941.GQ22424@edge>
References: <1519931281-26332-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519931281-26332-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/rocko/master][PATCH] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Thu, 01 Mar 2018 19:20:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7a4b4e7befc2aa1ca4f7f8bdf588962df352dcf9

If you want to instead build groff-native, it's fine with me, but need to 
remove HOSTTOOLS then.


On Thu, Mar 01, 2018 at 02:08:01PM -0500, Jacob Stiffler wrote:
> * groff is used to generate documentaion during the install task
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> index 4f36310..91d3cea 100644
> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> @@ -17,7 +17,7 @@ require recipes-core/llvm/llvm.inc
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>  
> -DEPENDS += "libxml2"
> +DEPENDS += "libxml2 groff-native"
>  DEPENDS_append_class-target = " valgrind"
>  
>  LLVM_DIR = "ti-llvm${PV}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

