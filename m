Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E3FED5299A
	for <meta-arago@arago-project.org>;
	Mon, 26 Nov 2018 19:25:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAQJP8ec062297
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 13:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543260308;
	bh=ytPcrVpkaAL4hgiaGhIMfrbQSJWCXOokjvm3bpn3FdA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DtmtSy18luz399lJdOhxYKoN45WblgjcuYV896/WL/CK5sa5dgFK/9MACjJXXtGGj
	JUt7/JjQgZLD82+Oc+eagljqws9CkHXXMwDmDMtw2+kgQVdVmvi8F0H6f0FhxHHY6z
	RmOe0zZjtBtv+WmWU+GCfdOZjm6/1kk2Ye80Qgxs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAQJP8sY068950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 13:25:08 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 26 Nov 2018 13:25:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 26 Nov 2018 13:25:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAQJP8IV030447;
	Mon, 26 Nov 2018 13:25:08 -0600
Date: Mon, 26 Nov 2018 14:25:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Krunal Bhargav <a0227568@ti.com>
Message-ID: <20181126192507.GE21933@beryl>
References: <1543252679-28171-1-git-send-email-a0227568@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543252679-28171-1-git-send-email-a0227568@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, k-bhargav@ti.com
Subject: Re: [meta-processor-sdk][PATCH] Commit ID update for the video-graphics-test
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
X-List-Received-Date: Mon, 26 Nov 2018 19:25:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages


On Mon, Nov 26, 2018 at 11:17:59AM -0600, Krunal Bhargav wrote:
> video-graphics-test application is enhanced to demonstrate GC320 usage
> for scaling, rotation and composition/overlaying feature. Updated the
> recipe to pick the new commit id.
> 
> Signed-off-by: Krunal Bhargav <a0227568@ti.com>
> ---
>  recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> index cbc664f..cee5c8c 100644
> --- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> +++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> @@ -9,7 +9,7 @@ DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
>  PR = "r2"
>  
>  BRANCH = "master"
> -SRCREV = "54ec5ff165413d41d32bb2672e127487ee37a82b"
> +SRCREV = "2db3848cd1047e688ea0a94a987e35a292bcbda9"
>  
>  SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
>  "
> -- 
> 1.9.1
> 

