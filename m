Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AA4CF529E3
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2020 18:44:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041Ig5bD110431
	for <meta-arago@arago-project.org>; Fri, 1 May 2020 13:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588358525;
	bh=1hrNZcsjawU8AFqmOFCNkpc4QUZFFzUdqdH3Rll0pzk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=bDVMoyGkqBOytnl4oD05CHpmJA3g/w95RizNrU9pUj89N5j9v7I57JN8jwAgSnUDb
	TvzW0eD5F3jxoQb6WhRSVdCJ+4Dy/Z+9fA8OqP/4JP+YHC5jANOODYoT1Js8pwEAb5
	+ZF7knEOofaJYopA6REmE/qaWZpQSfoJIn9qtn8w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 041Ig5xh038511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 1 May 2020 13:42:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 1 May 2020 13:42:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 1 May 2020 13:42:05 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041Ig4mH068812;
	Fri, 1 May 2020 13:42:04 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20200430103558.5797-1-nikhil.nd@ti.com>
	<20200430103558.5797-2-nikhil.nd@ti.com> <20200501014545.GF11212@beryl>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <58272312-70d1-8e2c-1e97-fcfcc19e3e2d@ti.com>
Date: Sat, 2 May 2020 00:12:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501014545.GF11212@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v2 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Fri, 01 May 2020 18:44:28 -0000
Content-Type: multipart/alternative;
	boundary="------------2362CAF8C8C303CA8E9711E3"
Content-Language: en-US

--------------2362CAF8C8C303CA8E9711E3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Denys,

On 01/05/20 7:15 am, Denys Dmytriyenko wrote:
> Thanks, this lookd good, but does not apply to master. Can you please rebase?
These recipes depend on rpmsg-char-helper.
I understand this package will get deprecated next week and some other 
interface needs to be used foe rpmsg-char.
If rpmsg-char-helper is not going to be added in the coresdk, we need to 
drop these as well.

Regards,
Nikhil D

>
>
> On Thu, Apr 30, 2020 at 04:05:58PM +0530, nikhil.nd@ti.com wrote:
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
>>
>> Notes:
>>      Changes from v1:
>>      * Add the package in correct packagegroup
>>
>>   .../packagegroup-arago-tisdk-addons.bb        |  2 +-
>>   .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> index 2913fa15..c8c445cb 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> @@ -77,7 +77,7 @@ UTILS_append_k3 = " mmc-utils \
>>   "
>>   
>>   UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
>> -UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>> +UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw statcol"
>>   
>>   UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>>   
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


--------------2362CAF8C8C303CA8E9711E3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    Denys,<br>
    <br>
    <div class="moz-cite-prefix">On 01/05/20 7:15 am, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200501014545.GF11212@beryl">
      <pre class="moz-quote-pre" wrap="">Thanks, this lookd good, but does not apply to master. Can you please rebase?</pre>
    </blockquote>
    These recipes depend on rpmsg-char-helper.<br>
    I understand this package will get deprecated next week and some
    other interface needs to be used foe rpmsg-char.<br>
    If rpmsg-char-helper is not going to be added in the coresdk, we
    need to drop these as well.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <blockquote type="cite" cite="mid:20200501014545.GF11212@beryl">
      <pre class="moz-quote-pre" wrap="">


On Thu, Apr 30, 2020 at 04:05:58PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

Statistics Collector is userspace application which communicates
with remote processors to get the statistics data on target.

This can be printed command line or sent over network for
host-side visualization.

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---

Notes:
    Changes from v1:
    * Add the package in correct packagegroup

 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2913fa15..c8c445cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -77,7 +77,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
-UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw statcol"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
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
+
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

--------------2362CAF8C8C303CA8E9711E3--
