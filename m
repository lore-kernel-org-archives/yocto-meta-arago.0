Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2E5A2529A9
	for <meta-arago@arago-project.org>;
	Thu, 28 Jun 2018 21:11:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5SLB69U109077
	for <meta-arago@arago-project.org>; Thu, 28 Jun 2018 16:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530220266;
	bh=Orz7H7zgHnJ/na6lA6PTa4mGD/UHHgNK3unscoFpeAs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DxznKwtX8mzDA/mBY3Uhd120dumZY+s9VpGkGiq9YzRUE4JVIb41Vdf0Ib8MQK1G6
	DYn7pLEUcPm5M4j9Lturfi6TmRit9vtDcp6fDeh2uQxPTYI6pxJfemtxcgD/qvOzh1
	Rio/JUJRiyqok93D0vtVEkPt1PP19C+4ts01eEgk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SLB6Y9027622
	for <meta-arago@arago-project.org>; Thu, 28 Jun 2018 16:11:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 28 Jun 2018 16:11:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 28 Jun 2018 16:11:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SLB5Gn000423;
	Thu, 28 Jun 2018 16:11:05 -0500
Date: Thu, 28 Jun 2018 17:10:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180628211010.GM26086@beryl>
References: <1530213583-30627-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1530213583-30627-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH] ti-tisdk-setup: bump SRCREV for enhanced create-sdcard
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
X-List-Received-Date: Thu, 28 Jun 2018 21:11:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

You probably really want this to get into rc2, though I already started test 
builds... I'll see if I can validate it quickly and squeeze in before tagging.

-- 
Denys


On Thu, Jun 28, 2018 at 03:19:43PM -0400, Jacob Stiffler wrote:
> * create-sdcard.sh has been enhanced to support k3
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 807f988..01bd6c9 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>  
> -PR = "r33"
> +PR = "r34"
>  
>  BRANCH ?= "master"
> -SRCREV = "2184048a4a01a338f9e839ffb39663805a4e7a58"
> +SRCREV = "55a17a0d1c5b385eec620c5f51e1d4e5ca6905cd"
>  SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git/"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

