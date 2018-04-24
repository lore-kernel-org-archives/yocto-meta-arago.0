Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2E685529C7
	for <meta-arago@arago-project.org>;
	Tue, 24 Apr 2018 16:55:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3OGtZgT015172
	for <meta-arago@arago-project.org>; Tue, 24 Apr 2018 11:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524588935;
	bh=puVeUtvOxMKxcrJPG3NZ3EvuNbX57x1tCuu2Kz3PrQk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sqXCLLyeTa9RNirdY34oX3jKMkIzvRrW1yD0cKxmPn4oAp4PpzltbIdeG97JFQaFX
	b6H4Aw65p5wqlqlTpgyFMpPvZhiYG2+wEpWh9qxEqyiW+g0jbg0defjH2AqXaCP9bi
	9g3WrdO/b5vJ7GMzrd4YGRZpfaRljdeWljblEsTo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3OGtZGg024745
	for <meta-arago@arago-project.org>; Tue, 24 Apr 2018 11:55:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Apr 2018 11:55:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 24 Apr 2018 11:55:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3OGtZVW029499;
	Tue, 24 Apr 2018 11:55:35 -0500
Date: Tue, 24 Apr 2018 12:55:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <yan-liu@ti.com>
Message-ID: <20180424165534.GF15846@edge>
References: <1524507176-14297-1-git-send-email-yan-liu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1524507176-14297-1-git-send-email-yan-liu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Tue, 24 Apr 2018 16:55:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is it a duplicate of the same one from yesterday?


On Mon, Apr 23, 2018 at 02:12:56PM -0400, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
> 
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> index f506c91..1517d17 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> @@ -4,7 +4,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -PR = "r3"
> +PR = "r4"
>  PV_append = "+git${SRCPV}"
>  
>  PROVIDES += "ltp"
> @@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
>  
>  inherit autotools-brokensep
>  
> -SRCREV = "5b4a12d2d372262cf1184a11340c0ee4f8e93f46"
> +SRCREV = "e2f4f79f1707b63586157801f63050d8f8479b67"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

