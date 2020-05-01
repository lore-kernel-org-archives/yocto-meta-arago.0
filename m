Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 57A7A529F9
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2020 18:45:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041Ih0JE052073
	for <meta-arago@arago-project.org>; Fri, 1 May 2020 13:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588358580;
	bh=N0x+5ZomwLXeqldBM2iUw3RvWRi/8vl/AcZWDohI2zw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=TbE9GQHLdqNqSp1tOvTctD6eFkI688DWfqwrgQ3ARPJw0RPSSnBT+cvTz9frR2//I
	3YLCTeJyoBe46f55DFqLO8YA/Qnt3GfYRgS/ku7HJ/JrjNy2Ki0x63zU3OxpMaPpVA
	WpJmqpTqQGmqmalN90P7Egc5n4vmf5JyiXrH2oEc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 041Ih0E5039238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 1 May 2020 13:43:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 1 May 2020 13:43:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 1 May 2020 13:43:00 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041IgwNf118156;
	Fri, 1 May 2020 13:42:59 -0500
To: <denys@ti.com>
References: <20200429074133.6274-1-nikhil.nd@ti.com>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <37e5f686-f7ff-da04-18da-474530e55b2c@ti.com>
Date: Sat, 2 May 2020 00:12:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429074133.6274-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1] recipes-devtools: Add rpmsg-char-helper recipe
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
X-List-Received-Date: Fri, 01 May 2020 18:45:22 -0000
Content-Type: multipart/alternative;
	boundary="------------619DC3A9C968003C96D8B1F6"
Content-Language: en-US

--------------619DC3A9C968003C96D8B1F6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Ignore this, The rpmsg-char-helper package will be deprecated from next 
release

Regards,
Nikhil D

On 29/04/20 1:11 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> rpmsg-char-helper library simplifies the userspace
> communication with the remoteproc devices.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   .../rpmsg-char-helper/rpmsg-char-helper.bb     | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
>
> diff --git a/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
> new file mode 100644
> index 00000000..ca008d7a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Rpmsg char Helper library recipe"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRCREV = "fba8b83ea02d978eefbbd65a885daafa9c93b479"
> +SRC_URI = "git://git.ti.com/glsdk/rpmsg-char-helper.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF_j7-evm += " \
> +	--with-soc=j7 \
> +"


--------------619DC3A9C968003C96D8B1F6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Denys,<br>
    <br>
    Ignore this, The rpmsg-char-helper package will be deprecated from
    next release<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <div class="moz-cite-prefix">On 29/04/20 1:11 pm, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200429074133.6274-1-nikhil.nd@ti.com">
      <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

rpmsg-char-helper library simplifies the userspace
communication with the remoteproc devices.

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 .../rpmsg-char-helper/rpmsg-char-helper.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb

diff --git a/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
new file mode 100644
index 00000000..ca008d7a
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Rpmsg char Helper library recipe"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263">"file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "fba8b83ea02d978eefbbd65a885daafa9c93b479"
+SRC_URI = "git://git.ti.com/glsdk/rpmsg-char-helper.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF_j7-evm += " \
+	--with-soc=j7 \
+"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------619DC3A9C968003C96D8B1F6--
