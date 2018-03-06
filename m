Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6C4F652975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 16:05:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26G4LhG020505
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:04:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520352261;
	bh=jHJGBu+2sWHa21mt68DYfKyArbeI72pAWTJx4tVq8Nw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=YSoTuuobQP4cab9EaQnaVGyq/SBGo11nQpSqTp8HGfESWYl/WevQx6AOnIJZZOulE
	z2BCMjxLJ4qeuqThbRKmH4S117Ala9kLsRIFbT5sgYgmJh1+E8+ayZubT6/9Dydc1U
	6FZJwhqV44D0lPUxLN8neL7Eq/iZ9C3NlxVZ1Fok=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26G4LYC019859
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:04:21 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:04:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 10:04:21 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26G4KfO007963;
	Tue, 6 Mar 2018 10:04:21 -0600
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1520348769-6194-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bc25f3fd-05f7-2991-6fbb-9ad20c1540d1@ti.com>
Date: Tue, 6 Mar 2018 11:04:20 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520348769-6194-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 16:05:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This patch does not apply. Please rebase and send a v2.


On 3/6/2018 10:06 AM, Eric Ruei wrote:
> - include gc320
> - QPA interface changes
> - dual-screen support
>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> index 28aacdf..ec676e7 100644
> --- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> +++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> @@ -4,12 +4,12 @@ SECTION = "multimedia"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>   
> -DEPENDS += "libdrm"
> +DEPENDS += "libdrm ti-gc320-libs"
>   
> -PR = "r0"
> +PR = "r1"
>   
>   BRANCH = "master"
> -SRCREV = "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
> +SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
>   
>   SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
>   "


