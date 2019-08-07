Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9E87752A34
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2019 01:14:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x771DHIh020891
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 20:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565140397;
	bh=Rwk2+/WrfU2iEjondHE/3hDNdY897O8Xw9YUI8+eR1I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FzPPE2lVW8W0cuWOQwkh7SfhTipVYTQspaZa2dlG6SRvaoNKqB+BFFWUk4zKz0XnW
	wF9M+asvT/nVpVVEasLQ1/YOvxyQR0X88pptQFIs/rpV1zL7er74Lzt3NHuB64/g2x
	jk7TsUDQKfuiQMB2A+rnQdIh92mTlhk3lo/CRQnw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x771DHCE096939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 20:13:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 20:13:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 20:13:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x771DG7b091109;
	Tue, 6 Aug 2019 20:13:16 -0500
Date: Tue, 6 Aug 2019 21:13:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <yan-liu@ti.com>
Message-ID: <20190807011316.GW19505@beryl>
References: <1565122120-19222-1-git-send-email-yan-liu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1565122120-19222-1-git-send-email-yan-liu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 07 Aug 2019 01:14:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This did not apply - did you forget to rebase?

On Tue, Aug 06, 2019 at 04:08:40PM -0400, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
> 
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> index 02b41d6..2d39e30 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> @@ -4,7 +4,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -PR = "r8"
> +PR = "r9"
>  PV_append = "+git${SRCPV}"
>  
>  PROVIDES += "ltp"
> @@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
>  
>  inherit autotools-brokensep
>  
> -SRCREV = "1053c84e8b0485019ab085b5fb4e3c0e72e701ec"
> +SRCREV = "95004a59952a9f94dfb3f98f94b58b0bb5db89b4"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> -- 
> 1.7.9.5
> 

