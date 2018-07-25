Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 271C1529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 16:41:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PGfitJ126866
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 11:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532536904;
	bh=NxaAXoWQzSyzGufSvb42DqgJXjkSEy7YhqIKdpXf/04=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ak7bxICAwtswNEpgwHRJOQ9Wfqq3qnzxf/Y5v3eNPZ3307m7zvXFzIWgKjN2fSZV8
	k8vB1n3Rgmpfiz+tO2l/svw+G2KD4xC6/9bmij6PsNOaAvMvPMUSt42w+blk/niT74
	hqZisiTCS3t0ehV65keO57YSLc7MTaGKK8xPxNqE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PGfixA009285
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 11:41:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 11:41:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Jul 2018 11:41:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PGfhgL011943;
	Wed, 25 Jul 2018 11:41:43 -0500
Date: Wed, 25 Jul 2018 12:40:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180725164017.GG2269@beryl>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
	<1532519588-17585-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1532519588-17585-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Djordje Senicic <x0157990@ti.com>
Subject: Re: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl: add tidl-utils
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
X-List-Received-Date: Wed, 25 Jul 2018 16:41:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Will any of these 3 be upstreamed?


On Wed, Jul 25, 2018 at 07:53:08AM -0400, Jacob Stiffler wrote:
> Cc: Djordje Senicic <x0157990@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> index 782affe..b1b74a9 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> @@ -1,6 +1,6 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>  
> -TIDL_PKGS = "tidl-examples-dev tidl-viewer"
> +TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils"
>  
>  EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
>  EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

