Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DC9FB5297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 19:20:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86JJpX0018467
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504725591;
	bh=286WUFhr7R1km6w8AndSJ+YnvArtsn/qzvmMsKAG8cU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=bMZ33Qo1LjgFspt5of7TpPktcY2xWTGLs7o4qtZSyWJGKlhAv/PCaRKrvCpUmVy4p
	8mLB10eFIkI+s3FTbE1VBp5pNmwiXsBpRxXC2l8ux3V4DNee7U1BsCZvyWg7DUfMub
	GDOjzPjyMjh21MfSHZbeEFQhX4gyVaOFSxvvtsQI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86JJkjG003224
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:19:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 14:19:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 14:19:46 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86JJkes008864;
	Wed, 6 Sep 2017 14:19:46 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1504724847-52601-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b22443a4-72f9-f36f-c5c5-22a7f10061df@ti.com>
Date: Wed, 6 Sep 2017 15:19:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504724847-52601-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] matrix-gui-browser-demos: bump SRCREV to pickup runGoogleChrome.sh fixes
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
X-List-Received-Date: Wed, 06 Sep 2017 19:20:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed.


On 9/6/2017 3:07 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend
>
> diff --git a/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend
> new file mode 100644
> index 0000000..9936396
> --- /dev/null
> +++ b/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".tisdk0"
> +
> +SRCREV = "c6fe9957de117bc87c48a7d63205dfae923bb5b9"


