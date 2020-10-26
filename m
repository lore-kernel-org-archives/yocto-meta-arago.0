Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5002B52999
	for <meta-arago@arago-project.org>;
	Mon, 26 Oct 2020 16:13:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09QGA12s128888
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 11:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603728601;
	bh=mXtpe5VLHQsJYTWqmVY7MxlAyW7As/uyjJ3u3FdRQxA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IjL8TQJ2Ni4JAcSsAGnjMd4NDU/ooZdOZlC82EFOk3vnMHHk1p8phWfN0vrHhtCub
	q+sd5oKMlSJlT7fD2ebtiutxXSWFFLdBao19ZTKJv7Dk+pCHyE0jrNNJgO9ePWffKg
	RzjTEVaPoGi3lBznsG0FtplfDsIdeRsLIzqcWGGo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09QGA1Js014980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 11:10:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 11:10:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 11:10:01 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09QG9xRT059133;
	Mon, 26 Oct 2020 11:10:00 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <denys@ti.com>, <aparnab@ti.com>
References: <20201026155125.31513-1-nikhil.nd@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1cfdbbf2-80e3-29b6-02f0-c6ef9b332168@ti.com>
Date: Mon, 26 Oct 2020 11:09:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026155125.31513-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH 1/2] websocketd: Add new recipe
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
X-List-Received-Date: Mon, 26 Oct 2020 16:13:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nikhil

On 10/26/20 10:51 AM, Nikhil Devshatwar wrote:
> websocketd is an application which allows to redirect output of
> command line applications via a websocket so that web pages can
> interact with them.
>
> This is very useful for visualizing statistics information on
> host machine browser.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>
> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> new file mode 100644
> index 00000000..44f549ee
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Application for routing native applications via websockets"
> +HOMEPAGE = "http://websocketd.com/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> +
> +PV = "0.3.0"
0.3.1 is available
> +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"

Is this valid for ARM32? Does this build for am3 or am4?

I see websocketd-0.3.1-linux_arm.zip available for 32 bit

> +SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +	install -d ${D}/${bindir}
> +	install -m 0755 ${S}/websocketd ${D}${bindir}/
> +}

