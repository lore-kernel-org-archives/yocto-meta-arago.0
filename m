Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 142AF529FF
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 07:02:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03T70H8s120121
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588143617;
	bh=etMa4ozCKGoRc7zixUqP8DR8SFL4+/m+5JiwK7Uz594=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=HqHN5ccyFRwi9wjcLaO2nEjs1pRbaXfrf8IF+6/YD4fy0K/yVTTEmLY7RCaETJmSv
	GZxUyCSPSf+r78QZfvmyeCLCcsuRFWbGDr+LKi/nD5JQoluUnuowCsH4a4oDNhz8l5
	TGpdmO+2rd72LgOtiAxhDbS6OYQZQR/ubofwKi98=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03T70HZo117697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:00:17 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 29 Apr 2020 02:00:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 29 Apr 2020 02:00:16 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T70FYw054517;
	Wed, 29 Apr 2020 02:00:16 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
	<20200426174223.8089-2-nikhil.nd@ti.com> <20200427223706.GC395@beryl>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <19d49725-4c55-296f-7eeb-43cb9c0845a4@ti.com>
Date: Wed, 29 Apr 2020 12:30:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427223706.GC395@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Wed, 29 Apr 2020 07:02:38 -0000
Content-Type: multipart/alternative;
	boundary="------------3BB42203DFD7D90E7453658B"
Content-Language: en-US

--------------3BB42203DFD7D90E7453658B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 28/04/20 4:07 am, Denys Dmytriyenko wrote:
> On Sun, Apr 26, 2020 at 11:12:23PM +0530, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Statistics Collector is userspace application which communicates
>> with remote processors to get the statistics data on target.
>>
>> This can be printed command line or sent over network for
>> host-side visualization.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   ...kagegroup-arago-tisdk-addons-sdk-target.bb |  1 +
>>   .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> index 54a59022..c6502a1f 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> @@ -135,6 +135,7 @@ UTILS_append_dra7xx = " can-utils-dev \
>>   UTILS_append_k2g = " can-utils-dev"
>>   UTILS_append_k3 = " can-utils-dev \
>>                       websocketd \
>> +                    statcol \
>>   "
>>   
>>   EXTRA_LIBS = ""
>> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> new file mode 100644
>> index 00000000..b87d940b
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "Statistics collector application"
>> +
>> +LICENSE = "TI-TSPA"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>> +
>> +PROTOCOL = "git"
>> +BRANCH = "master"
>> +SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
>> +SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>> +
>> +DEPENDS = "rpmsg-char-helper websocketd"
> Missing dependency on rpmsg-char-helper
Oh, I thought this has been upstreamed to meta-arago. Since the coresdk 
has support for rpmsg-char.
I will post the recipe for rpmsg-char-helper.

Regards,
Nikhil D
>
>
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"
>> +
>> +do_install() {
>> +	DESTDIR=${D} make install
>> +}
>> -- 
>> 2.17.1
>>


--------------3BB42203DFD7D90E7453658B
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
    <blockquote type="cite" cite="mid:20200427223706.GC395@beryl">
      <pre class="moz-quote-pre" wrap="">On Sun, Apr 26, 2020 at 11:12:23PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

Statistics Collector is userspace application which communicates
with remote processors to get the statistics data on target.

This can be printed command line or sent over network for
host-side visualization.

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  1 +
 .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 54a59022..c6502a1f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -135,6 +135,7 @@ UTILS_append_dra7xx = " can-utils-dev \
 UTILS_append_k2g = " can-utils-dev"
 UTILS_append_k3 = " can-utils-dev \
                     websocketd \
+                    statcol \
 "
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
new file mode 100644
index 00000000..b87d940b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Statistics collector application"
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0">"file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"</a>
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
+SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+DEPENDS = "rpmsg-char-helper websocketd"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Missing dependency on rpmsg-char-helper</pre>
    </blockquote>
    Oh, I thought this has been upstreamed to meta-arago. Since the
    coresdk has support for rpmsg-char.<br>
    I will post the recipe for rpmsg-char-helper.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200427223706.GC395@beryl">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"
+
+do_install() {
+	DESTDIR=${D} make install
+}
-- 
2.17.1

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------3BB42203DFD7D90E7453658B--
