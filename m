Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AA34D5297F
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 18:21:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JIKgwa001396
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560968442;
	bh=y0byIJ8J3t8uaDoyFF0WckP1/EMfLUYhlkdLxnpzjVY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yJ5ngW+Ub2O1M+6vcV/NmUWbOdGS1ETViN0jUIzGAuWF+w/aXVJvVPn4PA+p3Hk/8
	u7LOP6QFk21hrCyice8lkBFvReCH4yLkqIlGi9DcaENWg1lkJt3U6ebh050xPtS8oL
	zwcVXdC0WQ3UjaCA0vjJygKkycNDsTZ62GLQIdWI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JIKg16086055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:20:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 13:20:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 13:20:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JIKg4w012928;
	Wed, 19 Jun 2019 13:20:42 -0500
Date: Wed, 19 Jun 2019 14:20:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190619182041.GG32001@beryl>
References: <1560960696-17318-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560960696-17318-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH 1/1] linux-ti-staging: update to latest version
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
X-List-Received-Date: Wed, 19 Jun 2019 18:21:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 19, 2019 at 09:41:36PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_4.19.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> index 26b388b..ceec516 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> @@ -56,11 +56,11 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-4.19.y"
>  
> -SRCREV = "7d94bf0b5ba7a68aa735c422f40d53957d094f8b"
> -PV = "4.19.38+git${SRCPV}"
> +SRCREV = "d343b32d0ab8262cf0a0fa8f4bd2bf1745685984"
> +PV = "4.19.50+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "c"
> +MACHINE_KERNEL_PR_append = "d"

PR should be reset when PV gets updated.

Also, corresponding RT srecipe hould be updated as well.


>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

