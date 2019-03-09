Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BE89D52994
	for <meta-arago@arago-project.org>;
	Sat,  9 Mar 2019 12:34:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x29CYSUq111042
	for <meta-arago@arago-project.org>; Sat, 9 Mar 2019 06:34:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552134868;
	bh=LUeMWvMVhQ8G7To2FQKy3bRy1h5jf1XtB+5XexdzmVs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=p1USTww/Aan/kr/mmVIg9SGy1D7M+eLSD3NzHnfNFwx5/R1UsSa3Y877qVyZG45lX
	Gs9aVYOrcmA7IJm+zjKOPRw6CdTy9+cFmooocGsPyKp4ZrTs8q5w3WOL80Yqn03CMx
	h8SHcixfo8IxHYXpc27R0SujR2wyazwohjxrSN5w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x29CYSgb033548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 9 Mar 2019 06:34:28 -0600
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Sat, 9 Mar 2019 06:34:27 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
	<1552086127-40979-2-git-send-email-e-ruei1@ti.com>
	<20190308234846.GH26510@beryl>
	<b59f9ef7-e9be-3cc7-2f61-cf021da954cd@ti.com>
	<20190309010918.GB28041@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <dada21db-5715-9ed0-ef39-50dff5e37140@ti.com>
Date: Sat, 9 Mar 2019 07:34:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190309010918.GB28041@beryl>
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
X-List-Received-Date: Sat, 09 Mar 2019 12:34:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/8/2019 8:09 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 08, 2019 at 07:16:47PM -0500, Ruei, Eric wrote:
>> On 3/8/2019 6:48 PM, Denys Dmytriyenko wrote:
>>>> [PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
>>>
>>> atbase? typo?
>>>
>>>
>> Should I change it to wayland?
> 
> I was merely pointing to a typo in the subject - atbase instead of qtbase
> 
> But if you think this should go to wayland-conf instead of qtbase-conf, it's
> ok, but I thought eglfs was Qt-specific feature...
> 
> 
Oh, I see. It is a typo indeed. I thought that you meant "wl shell".
Thanks, I shall fix this one at v2.

Eric


>> Eric
>>
>>
>>> On Fri, Mar 08, 2019 at 06:02:07PM -0500, Eric Ruei wrote:
>>>> - add eglfs_kms configuration file
>>>> - switch to wl-shell because xdb-shell-v5 is obsolete
>>>>
>>>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>>> ---
>>>>   .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json         | 15 +++++++++++++++
>>>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh    |  3 ++-
>>>>   .../recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh            |  3 ++-
>>>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb       | 10 +++++++---
>>>>   4 files changed, 26 insertions(+), 5 deletions(-)
>>>>   create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>>>>
>>>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>>>> new file mode 100644
>>>> index 0000000..61b834b
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>>>> @@ -0,0 +1,15 @@
>>>> +{
>>>> +  "device": "/dev/dri/card0",
>>>> +  "hwcursor": false,
>>>> +  "pbuffers": true,
>>>> +  "outputs": [
>>>> +    {
>>>> +      "name": "VGA1",
>>>> +      "mode": "off"
>>>> +    },
>>>> +    {
>>>> +      "name": "HDMI1",
>>>> +      "mode": "1024x768"
>>>> +    }
>>>> +  ]
>>>> +}
>>>> \ No newline at end of file
>>>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>>>> index 9701a8e..2014d20 100644
>>>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>>>> @@ -2,5 +2,6 @@
>>>>   ### QT Environment Variables ###
>>>>   export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
>>>> +export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>>>   export QT_QPA_EGLFS_INTEGRATION=none
>>>> -export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
>>>> +export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>>>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>>>> index 68ccf04..8ff0508 100644
>>>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>>>> @@ -3,5 +3,6 @@
>>>>   ### QT Environment Variables ###
>>>>   export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
>>>>   export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
>>>> +export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>>>   export QT_QPA_EGLFS_INTEGRATION=none
>>>> -export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
>>>> +export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>>>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>>>> index b2ad0a8..5c2974e 100644
>>>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>>>> @@ -5,12 +5,16 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> -SRC_URI = "file://qt_env.sh"
>>>> +SRC_URI = "file://qt_env.sh \
>>>> +           file://eglfs_kms_cfg.json \
>>>> +          "
>>>> -# Add custom Arago qtbase Environment script file
>>>> +# Add custom Arago qtbase Environment script and eglfs_kms configuration file
>>>>   do_install () {
>>>>       install -d ${D}${sysconfdir}/profile.d
>>>>       install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
>>>> +    install -d ${D}${sysconfdir}/qt5
>>>> +    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
>>>>   }
>>>> -FILES_${PN} += "${sysconfdir}/profile.d/*"
>>>> +FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
>>>> -- 
>>>> 1.9.1
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>


