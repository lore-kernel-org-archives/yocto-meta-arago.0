Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4E8ED520E5
	for <meta-arago@arago-project.org>;
	Wed,  7 Oct 2020 16:02:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097FxWmE019490
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 10:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602086372;
	bh=9qmnmbylLhy9PBEdn+A93OZU0mc8kNK6qMwmf312QhE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Tx0cgd5QUBcMhbZXojT92k8F/kIllDXzWf3TJW/H9116VumGo+MM6p73kiOWUrZVw
	s0EzQm7nZSxdAFd+weFa1+KGDlEhuJV38mTdJXIaTmVT24nvIWSKbeuKGySwEl5r7v
	2oSZUeD39V5245ILOs5qFCC1Rxvpdfptsmo0sOpM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097FxWNi021664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 10:59:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 7 Oct 2020 10:59:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 7 Oct 2020 10:59:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097FxVW4054908;
	Wed, 7 Oct 2020 10:59:31 -0500
Date: Wed, 7 Oct 2020 11:59:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <20201007155930.GF23230@beryl>
References: <20201007155758.32716-1-aparnab@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201007155758.32716-1-aparnab@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 07 Oct 2020 16:02:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good, thanks.

On Wed, Oct 07, 2020 at 10:57:58AM -0500, Aparna Balasubramanian wrote:
> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> index 56a644e..fb0382d 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>  DEPENDS += "alsa-lib"
>  
>  PE = "1"
> -PR = "r5"
> +PR = "r6"
>  PV_append = "+git${SRCPV}"
>  
> -SRCREV = "9d8d90a7cba25bb1e61b41075ec4eab9bfc19d3d"
> +SRCREV = "ec5af0cc27ccf2481ccee77dfed5edc21a805b91"
>  BRANCH ?= "master"
>  
>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> -- 
> 2.7.4
> 

