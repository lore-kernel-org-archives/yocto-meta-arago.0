Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 22963529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:15:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JF9vq004614
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:15:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931709;
	bh=xSfNucgWLAw08saYKMXeEFsbRd25iQ/nrVew1Qxw8ok=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TM/e3U+c7b6OuE2E6HdoT+LY3/Hcwa21LJFwSfcvrFaofN4WnZNLaqIbiDWiMIcX2
	nahz6UK1uCONx+H2SqgMyBsGlznoPmGFqTW6qDOEgPX5aVCBWGPjhpqk+VqbfbKo6q
	7uW5CxNpLcSnHiTOeSE1coPCIEhCzkPNJ99dwg9U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JF9MC021457
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:15:09 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:15:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:15:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JF8oj019759;
	Thu, 1 Mar 2018 13:15:08 -0600
Date: Thu, 1 Mar 2018 14:15:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180301191508.GP22424@edge>
References: <1519931086-26137-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519931086-26137-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-tisdk-setup: bump SRCREV to latest
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
X-List-Received-Date: Thu, 01 Mar 2018 19:15:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Which branch?

On Thu, Mar 01, 2018 at 02:04:46PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 175fc3a..425bba6 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>  
> -PR = "r32"
> +PR = "r33"
>  
>  BRANCH ?= "master"
> -SRCREV = "1f2ce6e8d389ec32e1abbe80354c55f6e7259fc0"
> +SRCREV = "2184048a4a01a338f9e839ffb39663805a4e7a58"
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

