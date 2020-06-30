Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 77821529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 17:17:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UHFJUv077165
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593537319;
	bh=uThGni70Sag8lJnjpOfnzNAzlViPOML/txj5wFjboJ8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qOLCaP98PyiYeBRsZ198zwHS1LAuwH6Ct5s43dC2CRyi4l0ADlklB6f8KI7HaFnDr
	6W+HnnLgHvrFxKhsGiYnwAPTBSecjfO8zr9hcB0IY0PRJZC2n/5lzV5SHJltw/J/yc
	4vc5REG3ghwE7H1WaQSL3k6yEjUM1hE2jb8OkD+Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UHFJAb023590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:15:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 12:15:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 12:15:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UHFJkD062149;
	Tue, 30 Jun 2020 12:15:19 -0500
Date: Tue, 30 Jun 2020 13:15:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <nikhil.nd@ti.com>
Message-ID: <20200630171518.GJ7211@beryl>
References: <20200630170717.27124-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200630170717.27124-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, prao@ti.com
Subject: Re: [master/dunfell] packagegroup: tisdk-addons-sdk-host: Include gpu driver source based on MACHINE_FEATURES
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
X-List-Received-Date: Tue, 30 Jun 2020 17:17:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 30, 2020 at 10:37:17PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Check for gpu in MACHINE_FEATURES and include the source package
> for img rogue driver for j7-evm

This shouldn't be needed:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb;hb=HEAD#l12


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index adfcfa3e..7200e9f2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -43,6 +43,7 @@ UTILS_append_k3 = " \
>  "
>  
>  UTILS_append_j7 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'ti-img-rogue-driver-src', '', d)} \
>      pru-icss-src \
>  "
>  
> -- 
> 2.17.1
> 

