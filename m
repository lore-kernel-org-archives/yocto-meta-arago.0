Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 774A05207C
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 05:18:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u715IcQ9017899
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 00:18:38 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u715IbgQ025737
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 00:18:37 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u715IYl5024686
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 10:48:35 +0530
Received: from [172.24.158.157] (172.24.158.157) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 Aug 2016 10:48:31 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1469711089-3342-1-git-send-email-a0393906@ti.com>
	<1469711089-3342-4-git-send-email-a0393906@ti.com>
	<20160729231359.GC31835@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <579EDBA7.4030005@ti.com>
Date: Mon, 1 Aug 2016 10:48:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160729231359.GC31835@edge>
X-Originating-IP: [172.24.158.157]
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/4] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Mon, 01 Aug 2016 05:18:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Thanks for taking care of the rework for this patch.

I used the regular format-patch and send-email and didn't do anything 
different to send out this patch set.
If there is something that I should additionally do to avoid a patch 
corruption please let me know.

Regards
Karthik

On 30-Jul-16 4:43 AM, Denys Dmytriyenko wrote:
> This patch was corrupted for some reason. I ended up redoing it manually.
>
> On Thu, Jul 28, 2016 at 06:34:49PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> index cc481cb..a67aaf0 100644
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
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


