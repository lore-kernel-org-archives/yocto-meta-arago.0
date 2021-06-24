Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 23DC152A13
	for <meta-arago@arago-project.org>;
	Thu, 24 Jun 2021 15:16:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OFGXAv123794;
	Thu, 24 Jun 2021 10:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624547793;
	bh=WVDWQAwyRCowTpKuEY0zOz2hMALpmxZajI/ACi3CNG0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fx939sekw1nZsQnKbkWaQW8E6eIjUj7WaCuvjSP79YZYVnEwpxDq5ojbUHAIne5WZ
	6Xxpy+DTGMj0eNDegVwZKuwMq6HzEAiIe6Rs6Qqrqm6UmeXzYM8Zevi+9wV4ZiEuvN
	hKHkw2xncx5aG4Ttb5S9ZmQotRQa5jbYYxvRY6Lo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OFGXkH027934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Jun 2021 10:16:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 24 Jun 2021 10:16:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 24 Jun 2021 10:16:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OFGV7m085335;
	Thu, 24 Jun 2021 10:16:32 -0500
Date: Thu, 24 Jun 2021 20:46:31 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Message-ID: <20210624151631.gvdrwhtflmenyd5a@NiksLab>
References: <20210624151425.4314-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210624151425.4314-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui-apps-git: Update SRCREV to the latest
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
X-List-Received-Date: Thu, 24 Jun 2021 15:16:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:44-20210624, Nikhil Devshatwar wrote:
> From: Aparna M <a-m1@ti.com>
> 
> Update SRCREV to the latest.
> This add a matrix application to blink LED for AM64x EVM
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---

missed adding the branch tag
this is applicable to both dunfell and master branch

Regards,
Nikhil D

>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index d4956903..fac1fc8d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "30424117fc609beffb512450fe0d9b328d75b458"
> +SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
>  BRANCH = "master"
>  INC_PR = "r76"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

