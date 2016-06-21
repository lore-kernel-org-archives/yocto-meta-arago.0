Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 475145299F
	for <meta-arago@arago-project.org>;
	Tue, 21 Jun 2016 01:15:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5L1FO4G001437
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 20:15:24 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5L1FNTZ027390
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 20:15:24 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5L1FLOG019131
	for <meta-arago@arago-project.org>; Tue, 21 Jun 2016 06:45:22 +0530
Received: from [172.22.218.66] (172.22.218.66) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Jun 2016 06:45:20 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1465821936-2658-1-git-send-email-a0393906@ti.com>
	<1465821936-2658-3-git-send-email-a0393906@ti.com>
	<20160620211113.GG2177@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <57689528.6090705@ti.com>
Date: Tue, 21 Jun 2016 06:45:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160620211113.GG2177@edge>
X-Originating-IP: [172.22.218.66]
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Tue, 21 Jun 2016 01:15:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

On 21-Jun-16 2:41 AM, Denys Dmytriyenko wrote:
> On Mon, Jun 13, 2016 at 06:15:36PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/include/arago-prefs.inc             | 8 ++++++++
>>   .../recipes-core/packagegroups/packagegroup-arago-gst.bb          | 2 +-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> index 14a7c8a..ce0814f 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -66,3 +66,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>>   PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
>>   PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
>>   PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
>> +
>> +PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
>> +PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
>> +PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
>> +PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
>> +PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
>> +PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
> Will this break am3 and am4 support by patch #1?
I'm not really sure, perhaps we should add the machine specific 
PREFERRED_VERSION until the am3 and am4 support is worked out?
>
>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>> index d34051e..161430c 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>> @@ -27,7 +27,7 @@ GSTREAMER_DEPS_append_keystone = " \
>>   
>>   GSTREAMER_ACCEL_MM = ""
>>   GSTREAMER_ACCEL_MM_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
>> -GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
>> +#GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
> Will this be added later or is it going away?
We are still evaluating and also there is more recipe updates required 
for bug fixes on GST 1.6, so some more patches will come in for 
GStreamer and at which point we can decide on the vpe plugin.
Let us keep it until that time.
>
>
>>   RDEPENDS_${PN} = "\
>>       ${GSTREAMER_DEPS} \


