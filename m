Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5FEEE529FE
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 18:56:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UItM92106971
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 13:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572461722;
	bh=MWd6zDVJm9gWZ0N2B7Wd0WJlEcCJmZ/Vzi4FPJSXSqw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=A/IPe0stqhf9pBBmiHFpqnXkkQ7E8d3hY6NGCHvJnmsaFEtqjVRZ8b7h1Kkb75YKs
	IGtCKWMPzduiuzomryl42uUOuOztOn72YV3t4Okyv4hMFxS7cvTBs9mVcNwnwKP2Ds
	R8uQNaofj1iqNEW4CPLSgb7C7RCPCBxJvzwH7oIw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UItMUa075265
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 13:55:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 13:55:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 13:55:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UItLOr007060;
	Wed, 30 Oct 2019 13:55:21 -0500
Date: Wed, 30 Oct 2019 14:55:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191030185521.GC32214@beryl>
References: <20191030185354.63767-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191030185354.63767-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud][PATCH v2] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Wed, 30 Oct 2019 18:56:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 30, 2019 at 02:53:54PM -0400, Eric Ruei wrote:
> This is required because the default value of x11 is true if not specified.
> Note: This change is already in upstream master/zeus and is only needed
>       temporarily in thud.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>

Thanks, ack.


> ---
>  .../recipes-graphics/libepoxy/libepoxy_%.bbappend              | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100755 meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> new file mode 100755
> index 00000000..15c373cd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".arago0"
> +
> +PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

