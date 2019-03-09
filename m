Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 51549529BF
	for <meta-arago@arago-project.org>;
	Sat,  9 Mar 2019 00:16:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x290GmEQ087443
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 18:16:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552090608;
	bh=Z0SJoh+evW+MwZsmY6tJfmYO+tvfZnECCgaiXeqYA2Q=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ElB4xdlliWTczEHTOA0y55y8XUwUc3CkuwxYA837L2AL6sVZ4mywiGjc8Xy5g6jlR
	D4Hv1bW/2069UkVwtxp/nfzmH2UbyhIYol1dqddvVXPHiNxENi0kxb2jencMj9wQT3
	4KYm7shdh7TK2U67RPFjWpVghYIZ2kKvBVIvsu9Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x290Gm6G028867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 18:16:48 -0600
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 18:16:47 -0600
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
	<1552086127-40979-2-git-send-email-e-ruei1@ti.com>
	<20190308234846.GH26510@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <b59f9ef7-e9be-3cc7-2f61-cf021da954cd@ti.com>
Date: Fri, 8 Mar 2019 19:16:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190308234846.GH26510@beryl>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
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
X-List-Received-Date: Sat, 09 Mar 2019 00:16:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/8/2019 6:48 PM, Denys Dmytriyenko wrote:
>> [PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
> 
> atbase? typo?
> 
> 
Should I change it to wayland?

Eric


> On Fri, Mar 08, 2019 at 06:02:07PM -0500, Eric Ruei wrote:
>> - add eglfs_kms configuration file
>> - switch to wl-shell because xdb-shell-v5 is obsolete
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json         | 15 +++++++++++++++
>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh    |  3 ++-
>>   .../recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh            |  3 ++-
>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb       | 10 +++++++---
>>   4 files changed, 26 insertions(+), 5 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>> new file mode 100644
>> index 0000000..61b834b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>> @@ -0,0 +1,15 @@
>> +{
>> +  "device": "/dev/dri/card0",
>> +  "hwcursor": false,
>> +  "pbuffers": true,
>> +  "outputs": [
>> +    {
>> +      "name": "VGA1",
>> +      "mode": "off"
>> +    },
>> +    {
>> +      "name": "HDMI1",
>> +      "mode": "1024x768"
>> +    }
>> +  ]
>> +}
>> \ No newline at end of file
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> index 9701a8e..2014d20 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> @@ -2,5 +2,6 @@
>>   
>>   ### QT Environment Variables ###
>>   export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
>> +export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>   export QT_QPA_EGLFS_INTEGRATION=none
>> -export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
>> +export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> index 68ccf04..8ff0508 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> @@ -3,5 +3,6 @@
>>   ### QT Environment Variables ###
>>   export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
>>   export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
>> +export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>   export QT_QPA_EGLFS_INTEGRATION=none
>> -export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
>> +export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>> index b2ad0a8..5c2974e 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>> @@ -5,12 +5,16 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -SRC_URI = "file://qt_env.sh"
>> +SRC_URI = "file://qt_env.sh \
>> +           file://eglfs_kms_cfg.json \
>> +          "
>>   
>> -# Add custom Arago qtbase Environment script file
>> +# Add custom Arago qtbase Environment script and eglfs_kms configuration file
>>   do_install () {
>>       install -d ${D}${sysconfdir}/profile.d
>>       install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
>> +    install -d ${D}${sysconfdir}/qt5
>> +    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
>>   }
>>   
>> -FILES_${PN} += "${sysconfdir}/profile.d/*"
>> +FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


