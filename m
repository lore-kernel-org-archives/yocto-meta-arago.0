Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5929B52979
	for <meta-arago@arago-project.org>;
	Fri, 15 May 2020 18:48:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FIk6jX038646
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 13:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589568366;
	bh=1kDYE9CYtmoFoc4JXi77wU0Q8yw+MxehzBHiFgROJME=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ToU3xqwzHMqBxNdPKX8fbv7bxK4DVBwoNWpe7eabydtJh5qXPlwkHPEoP7Wbgmnnf
	Xi0drSPcurv3T6u8mhp75+p8z6HTT4qysDnWIwk9Oi7UghSqPo8E1TdtNnOBefj7E4
	b3xn+T88xcTylvwjWjKC5q4Jgr1youA318qgycOM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FIk65c076337
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 13:46:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 15 May 2020 13:46:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 15 May 2020 13:46:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FIk5ev066943;
	Fri, 15 May 2020 13:46:06 -0500
Date: Fri, 15 May 2020 14:46:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <prao@ti.com>
Message-ID: <20200515184605.GG8594@beryl>
References: <20200515184439.3339-1-prao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200515184439.3339-1-prao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] packagegroup: Add ti-sci-fw-src to tisdk-addons-sdk-host
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
X-List-Received-Date: Fri, 15 May 2020 18:48:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you even tried it yourself?


On Sat, May 16, 2020 at 12:14:39AM +0530, prao@ti.com wrote:
> From: Praveen Rao <prao@ti.com>
> 
> Add source package for k3 image gen in the tisdk-addons-sdk-host
> 
> Signed-off-by: Praveen Rao <prao@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index 6dcb253c..32d6c98b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -38,6 +38,7 @@ UTILS_append_k2g = " \
>  
>  UTILS_append_k3 = " \
>      jailhouse-src \
> +    ti-sci-fw-src \
>      arm-trusted-firmware-src \
>  "
>  
> -- 
> 2.17.1
> 

