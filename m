Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A18E052974
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 23:54:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1PNs4gj056432
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 17:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551138844;
	bh=pn1IMHi1eAQXzLfxLSilFGg3OKNutsh7W/KJvAiZCC0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GH6C7MGemIafgh/Aox1cpCSQW9yFt38YtQJEgmoY8y4lEkEnKoBPCUv84g4cYPDdM
	uRHyEBVzrKJv6RC9T4j8YfmXVs/BBuNYUaxiItVE/UpH/cMlhPLCF4RZQmFrSo2FQ7
	Q2wwaxQHIWjYksHLNDZVVjfUF3RCfdz5TXTUoWFk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1PNs4QZ021874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 17:54:04 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 25 Feb 2019 17:54:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 25 Feb 2019 17:54:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1PNs4Qu024676;
	Mon, 25 Feb 2019 17:54:04 -0600
Date: Mon, 25 Feb 2019 18:54:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20190225235403.GD29650@beryl>
References: <1551138754-60905-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551138754-60905-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui-apps: bump SRCREV to get multimedia script changes
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
X-List-Received-Date: Mon, 25 Feb 2019 23:54:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Which branch?

On Mon, Feb 25, 2019 at 06:52:34PM -0500, Eric Ruei wrote:
> - multimedia pipeline enhancements: enable kmssink for AM4/6
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 49e9e74..e8fed13 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "94e9f17332065fa838d9334efdab8451c8119b8d"
> +SRCREV = "22d15489ed9e0fcd0b8734a87cf23db47d13aa46"
>  BRANCH = "master"
> -INC_PR = "r65"
> +INC_PR = "r66"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

