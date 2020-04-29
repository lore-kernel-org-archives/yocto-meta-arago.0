Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0C480529FF
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 07:04:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03T71rVn077441
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588143713;
	bh=QC5S1wnK6oCfolZWSDPou4MCaNqo76p1jh491QY9x54=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WpCCETDfeZBNgus1ymcaUY/jIMdeLds9vjahoDKt7U0eMAmgfRDXre5cNwIW/iyTH
	ffCo/vl+ygfyT9AT+XgX3RN1dcEQHsIVGJOO+zwj2J/H1Go7K0U/R1CnCnR/5Pb6VQ
	qytrg/LQmXcOygSSLJqgBjqEXV/ioLh/EjLFackY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03T71j0s120664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:01:51 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 29 Apr 2020 02:01:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 29 Apr 2020 02:01:48 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T71iv0110211;
	Wed, 29 Apr 2020 02:01:46 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
	<20200427223734.GD395@beryl>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <f57d9d3d-c065-6ed6-c52b-c9f9698a51de@ti.com>
Date: Wed, 29 Apr 2020 12:31:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427223734.GD395@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1 1/2] recipes-devtools: websocketd: Add new recipe for websocket app
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
X-List-Received-Date: Wed, 29 Apr 2020 07:04:14 -0000
Content-Type: multipart/alternative;
	boundary="------------EDB03D53F6876996D57C9C9E"
Content-Language: en-US

--------------EDB03D53F6876996D57C9C9E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 28/04/20 4:07 am, Denys Dmytriyenko wrote:
> On Sun, Apr 26, 2020 at 11:12:22PM +0530, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> websocketd is a userspace application which allows to send
>> data over web sockets. This is used in SDK for visualizing
>> statistics parameters.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   ...packagegroup-arago-tisdk-addons-sdk-target.bb |  4 +++-
>>   .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> index 26925f2f..54a59022 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> @@ -133,7 +133,9 @@ UTILS_append_dra7xx = " can-utils-dev \
>>                           elfutils-staticdev \
>>   "
>>   UTILS_append_k2g = " can-utils-dev"
>> -UTILS_append_k3 = " can-utils-dev"
>> +UTILS_append_k3 = " can-utils-dev \
>> +                    websocketd \
> Why are you adding it to the devkit?
This is an on target utility.
Please suggest the best place for including this.


Regards,
Nikhil D
>
>> +"
>>   
>>   EXTRA_LIBS = ""
>>   EXTRA_LIBS_append_ti43x = "\
>> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>> new file mode 100644
>> index 00000000..44f549ee
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Application for routing native applications via websockets"
>> +HOMEPAGE = "http://websocketd.com/"
>> +
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
>> +
>> +PV = "0.3.0"
>> +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
>> +SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
>> +
>> +S = "${WORKDIR}"
>> +
>> +do_install() {
>> +	install -d ${D}/${bindir}
>> +	install -m 0755 ${S}/websocketd ${D}${bindir}/
>> +}
>> -- 
>> 2.17.1
>>


--------------EDB03D53F6876996D57C9C9E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 28/04/20 4:07 am, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200427223734.GD395@beryl">
      <pre class="moz-quote-pre" wrap="">On Sun, Apr 26, 2020 at 11:12:22PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

websocketd is a userspace application which allows to send
data over web sockets. This is used in SDK for visualizing
statistics parameters.

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 ...packagegroup-arago-tisdk-addons-sdk-target.bb |  4 +++-
 .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 26925f2f..54a59022 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -133,7 +133,9 @@ UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-staticdev \
 "
 UTILS_append_k2g = " can-utils-dev"
-UTILS_append_k3 = " can-utils-dev"
+UTILS_append_k3 = " can-utils-dev \
+                    websocketd \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why are you adding it to the devkit?
</pre>
    </blockquote>
    This is an on target utility.<br>
    Please suggest the best place for including this.<br>
    <br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200427223734.GD395@beryl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_ti43x = "\
diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
new file mode 100644
index 00000000..44f549ee
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Application for routing native applications via websockets"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://websocketd.com/">"http://websocketd.com/"</a>
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2">"file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"</a>
+
+PV = "0.3.0"
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip">"https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"</a>
+SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/websocketd ${D}${bindir}/
+}
-- 
2.17.1

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------EDB03D53F6876996D57C9C9E--
