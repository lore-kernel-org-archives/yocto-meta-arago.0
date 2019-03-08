Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4F54652A43
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:13:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28NDl3i019922
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:13:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552086827;
	bh=GoCXxs81pQ3rtnNcUk3B2ckSc9gfDtcv7DltxtcHrNA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WCLeg5tV3AlG9Hv7Oe63HaqUU2PglBR0zHxrBTswGiVCRTjprMrp0XqGu0GjFdi+s
	c/9OibN5k+3zQm+LtjpHPXxlCmthJq2IKdemLBd0Z/kxgyANOlHYKhw2FmHvuRtIVF
	TRP38vnGGcNH++0feu+zu8ls96p6w2GjK0dkN6pQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28NDlI1064941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:13:47 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:13:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 17:13:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28NDkbg021971;
	Fri, 8 Mar 2019 17:13:46 -0600
Date: Fri, 8 Mar 2019 18:13:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20190308231346.GE26510@beryl>
References: <20190305191016.24497-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190305191016.24497-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com
Subject: Re: [rocko/master][PATCH] matrix-gui:bump up SRCREV to include additional TIDL demos
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
X-List-Received-Date: Fri, 08 Mar 2019 23:13:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should this be merged first, before the other 2 related patches?


On Tue, Mar 05, 2019 at 02:10:16PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index e8fed13a..82882ea4 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "22d15489ed9e0fcd0b8734a87cf23db47d13aa46"
> +SRCREV = "f9fa5cb158902b6a3520fb7e853cc049ea920ae5"
>  BRANCH = "master"
> -INC_PR = "r66"
> +INC_PR = "r67"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

