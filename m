Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 09010529F6
	for <meta-arago@arago-project.org>;
	Fri,  2 Mar 2018 22:57:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w22MuNfo026090
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 16:56:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520031383;
	bh=Q0xfFIGQim6JUhchIJrOAU1Ppoy/NB7mAdfjbsidCfc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=B6nZH5mZMw8P/jAVr3c2maeqae08fZiyGNnF/J3N8W1YYXFmNvtyKU65DIMnE3Z72
	SRKzbq4eNIT/nvbZ3bBwKV0lmxxn5Sjdj8gFi5K4qRH+ppfcyYpF9rFJnor3swZ2ct
	2HU1p0wKmdRRKugAs3P01PwnHIXCFu4eiyqsrP/Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w22MuNre024497
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 16:56:23 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 2 Mar 2018 16:56:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 2 Mar 2018 16:56:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w22MuNnj001680;
	Fri, 2 Mar 2018 16:56:23 -0600
Date: Fri, 2 Mar 2018 17:56:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20180302225622.GK25063@edge>
References: <20180302225535.110274-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180302225535.110274-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl: update to version 01.01.14.11
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
X-List-Received-Date: Fri, 02 Mar 2018 22:57:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! I'll try to merge it tonight.

On Fri, Mar 02, 2018 at 04:55:35PM -0600, Yuan Zhao wrote:
> - opencl: minor fixes for building with GCC 7.2.1
> 
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index b2c90671..635bb911 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.14.10"
> +PV = "1.1.14.11"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "4669e010c35591154872d2364be720dc12b6b112"
> +OCL_SRCREV = "6bbf15687cffc62567848e2c041e9c2dbddea999"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

