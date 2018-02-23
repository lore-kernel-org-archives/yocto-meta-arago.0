Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0FFA952985
	for <meta-arago@arago-project.org>;
	Fri, 23 Feb 2018 19:33:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1NJWlm2030980
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 13:32:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519414367;
	bh=o18AlI1MuxEGRW2+8bSJKmviLEHRa1Ofu9gxzC/xTkw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=FUooRZhxhs9jx3uLrZOplo2m+Tl6g6uqguxVm5ZZZGor7Ptsnc8lgBxk8wOArML1u
	x0MKBwHApZIey4CXrRVnte+n144gQ+3Y35yxASUPUacIGD6fBltXVY/kqQopkchv1x
	pv0w3e08OA8TCf5ZOTl5JaP78+I6P3I+BfP8HW5o=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NJWlP1007857
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 13:32:47 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 13:32:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 13:32:46 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NJWkM1026990;
	Fri, 23 Feb 2018 13:32:46 -0600
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1519177646-5449-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b5a492dd-fe37-b40f-ebd9-e5e4f4424622@ti.com>
Date: Fri, 23 Feb 2018 14:32:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1519177646-5449-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [PATCH] opencv: Fix OpenCL linking with unused DSP library
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
X-List-Received-Date: Fri, 23 Feb 2018 19:33:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you also apply this to morty?

Thank you,

Jake


On 2/20/2018 8:47 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> index bf33a2e..3915c4d 100644
> --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> +++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> @@ -11,7 +11,7 @@ SRC_URI_append += "\
>        file://setupEnv.sh \
>   "
>   
> -SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
> +SRCREV_opencv = "9b88e8c746e531a1b4cc61e5235e4e747c319945"
>   
>   DEPENDS_remove_keystone = "qtbase"
>   


