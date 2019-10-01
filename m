Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5E0F4529DB
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 15:08:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91F6qZ5019138
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 10:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569942412;
	bh=+hJ03WFR46e0NE58LXH1GamvgU+KpZXjTR0J3Myan2Q=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=lnJuFpopY2gdYTdtFMWgyS+qKRjcKrgOuQPml42oaexu//jvTo6jq5c2NRUIhHn2V
	B8ED3xuVVa50vfDdlY/8EE7cV0gMZi5y1/9sv1bSEY12snve9zDI/pEZXH/OYRYdzq
	DbO4u2LXZrK0ulHSYOW8wtJNv3YpOfjLx1Sirdfs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91F6p0J019594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 10:06:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 10:06:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 10:06:51 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91F6pkh056100;
	Tue, 1 Oct 2019 10:06:51 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <1569933857-77302-1-git-send-email-nikhil.nd@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <af60f4cc-3500-8e8f-54f9-c06c1df1e704@ti.com>
Date: Tue, 1 Oct 2019 11:06:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569933857-77302-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master PATCH v1] recipes-tisdk: makefile: Move matrix-gui out of common targets
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
X-List-Received-Date: Tue, 01 Oct 2019 15:08:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

NAK


This "matrix-gui" is the html files which provide the gui. They are use 
on all platforms. Graphics is not needed as you can remotely view matrix 
from a remote browser.

It is the "matrix-gui-browser" which provides to platform QT application.


On 10/1/2019 8:44 AM, Nikhil Devshatwar wrote:
> Many machines do not support matrix-gui. Remove the Makefile target
> matrix-gui from the list of common targets.
>
> This will ensure that the make all / make install on other machine SDKs
> will not cause failures.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 28b616d..e99821e 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -57,7 +57,8 @@ SRC_URI = "\
>   
>   PR = "r102"
>   
> -MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
> +MAKEFILES_MATRIX_GUI = "matrix-gui \
> +                        matrix-gui-browser \
>                           refresh-screen \
>                           qt-tstat \
>   "
> @@ -67,7 +68,6 @@ MAKEFILES_MATRIX_GUI_omapl138 = ""
>   MAKEFILES_MATRIX_GUI_j7-evm = ""
>   
>   MAKEFILES_COMMON = "linux \
> -                    matrix-gui \
>                       arm-benchmarks \
>                       am-sysinfo \
>                       oprofile-example \

