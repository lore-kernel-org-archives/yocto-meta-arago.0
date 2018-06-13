Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A20D55299A
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 05:26:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5D5Qh7M012378
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 00:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528867603;
	bh=462EaTidXx72HsYFmT6fGeYoiNkBO00NI3Z0bxddwzg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=URBX6Kp3KAhftC34sAF8jOxqhJeSERN9HZ/PXtoVxdSSmksYt7ZjEcpCaGLhkVpTI
	29VBiFb9K8Kt4YjqBtQlHWHZwez7hRxiELiXpP6VSJ09uwEFMTxlwAZV3pBBNJQB5O
	8bIdarSDKerQaIm6oXTfC08RjNQcdnmnrQq99OwA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5D5QhEa017560
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 00:26:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 00:26:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 00:26:42 -0500
Received: from [172.24.158.83] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5D5QfmM000519;
	Wed, 13 Jun 2018 00:26:42 -0500
To: Ramprasad N <x0038811@ti.com>, <meta-arago@arago-project.org>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
	<1528778710-2395-3-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <06e5f868-c124-77b4-54c6-57cfa986b769@ti.com>
Date: Wed, 13 Jun 2018 10:56:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528778710-2395-3-git-send-email-x0038811@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko V2 2/2] gst-ducati: Update SRCREV with latest commit
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
X-List-Received-Date: Wed, 13 Jun 2018 05:26:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: Karthik Ramanan <a0393906@ti.com>


On 12-Jun-18 10:15 AM, Ramprasad N wrote:
> This update brings in setting display-delay property
> for ducati h264decoder.
>
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> index 6c6a474..556dc31 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>   
>   require gstreamer1.0-plugins-ti.inc
>   
> -PR = "${INC_PR}.28"
> -SRCREV = "7f3326b81b838fb6c916acd1d6a3090fda12c772"
> +PR = "${INC_PR}.29"
> +SRCREV = "19e911bb45757d8341ffd7819ca783ca04f5e3b1"
>   
>   BRANCH ?= "master"
>   


