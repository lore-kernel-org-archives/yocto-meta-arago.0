Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C030E52968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 13:22:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JDLnfC007642
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 08:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521465709;
	bh=LinKDUVkZvIL3zMBHwMUb5XQ9NVsJIXiefZIlzuurYQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MXgKfT4sGkMU8Roc462/eDXuvkBWUjq4IIyTwlb7O+ALsczURAcxbYXoS8wCwAP0d
	hS74PKojtiWupMotg3LLGUBzFI8En+tm3HUP5Sq74mkv59R9jjxs/J2qaL8dHsBH2M
	eHkJptuifbqH63WI0jbVWy/jyg5BUA8UwMCFIeWU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JDLnrE031075
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 08:21:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 08:21:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 08:21:49 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JDLni4024096;
	Mon, 19 Mar 2018 08:21:49 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1521304713-8408-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <50646fe0-043f-2331-d07d-10f17255e45c@ti.com>
Date: Mon, 19 Mar 2018 09:21:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521304713-8408-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH 1/2] matrix-gui-multimedia-demos: add video-graphics demo
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
X-List-Received-Date: Mon, 19 Mar 2018 13:22:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/17/2018 12:38 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
>
> diff --git a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
> new file mode 100644
> index 0000000..2cddc90
> --- /dev/null
> +++ b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
> @@ -0,0 +1,10 @@
> +PR_append = ".tisdk0"
> +
> +SRCREV = "71c1049e7a73cc731766aa72fc7197a45003625d"
> +
> +PACKAGES_append = "matrix-multimedia-demo-video-graphics"

Need a space here since this is an append.

> +
> +RDEPENDS_matrix-multimedia-demo-video-graphics  = "${MULTIMEDIA_RDEPENDS}"
> +
> +FILES_matrix-multimedia-demo-video-graphics     = "${MATRIX_APP_DIR}/video-graphics/*"

I think this should be "video_graphics", not "video-graphics". Is this 
correct?

> +


