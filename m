Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E7CA8529EF
	for <meta-arago@arago-project.org>;
	Fri, 17 May 2019 20:42:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4HKfhOg077461
	for <meta-arago@arago-project.org>; Fri, 17 May 2019 15:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558125703;
	bh=1ZO3V9W2KctANJMy9DYSOkY0DSJqSFNGc6U/sotjS+M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oP8iBm0mA7GjR65Ty+acaAhQJoySNYgnhTa26ubtJnUaxSAcKWwuo0730J/dd3Jwv
	VUmLr3c82EOa96vxI/laT6rEwvFCkqXlx5hweUkIhuuhPx+8QuZ0+z7n15yGPfncAV
	4h2bLwsLObjnDmzuPZStRIc8mzsUCcR4Sn/BbH50=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4HKfhoV011532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 17 May 2019 15:41:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 17 May 2019 15:41:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 17 May 2019 15:41:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4HKfgTi074794;
	Fri, 17 May 2019 15:41:42 -0500
Date: Fri, 17 May 2019 16:41:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20190517204142.GG22633@beryl>
References: <20190517190232.42112-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190517190232.42112-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-qte: fix typo for qtwebkit examples
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
X-List-Received-Date: Fri, 17 May 2019 20:42:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 17, 2019 at 03:02:32PM -0400, Eric Ruei wrote:
> It should be qtwebkit-examples-examples.

> This patch can be squashed to
> the previous one if it is possible.

Any remarks like this should not be part of commit log, hence need to be 
placed after the '---' line.

Anyway, cannot squash it any more - the previous patch was already merged.


> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> index b2ca56eb..662d3dd3 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> @@ -22,7 +22,7 @@ QT5_DEMOS = "\
>      qtscript-examples \
>      qtsvg-examples \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
> -    qtwebkit-examples \
> +    qtwebkit-examples-examples \
>      qtserialport-examples \
>  "
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

