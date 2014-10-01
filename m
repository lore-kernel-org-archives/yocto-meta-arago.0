Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E48815298E
	for <meta-arago@arago-project.org>;
	Wed,  1 Oct 2014 07:04:29 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9174KTF015273
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 02:04:28 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9174IDc005227
	for <meta-arago@arago-project.org>; Wed, 1 Oct 2014 12:34:19 +0530
Received: from [172.24.145.50] (172.24.145.50) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 1 Oct 2014 12:34:17 +0530
Message-ID: <542BA771.6080409@ti.com>
Date: Wed, 1 Oct 2014 12:34:17 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Yaniv Machani <yanivma@ti.com>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
	<1409844854-17247-2-git-send-email-a0393906@ti.com>
	<20140911222951.GL18620@edge> <20140930212359.GU6303@edge>
In-Reply-To: <20140930212359.GU6303@edge>
X-Originating-IP: [172.24.145.50]
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH 1/3] tisdk-connectivity: Add support for omap-a15 based targets
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
X-List-Received-Date: Wed, 01 Oct 2014 07:04:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01-Oct-14 2:53 AM, Denys Dmytriyenko wrote:
> On Thu, Sep 11, 2014 at 06:29:51PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Sep 04, 2014 at 09:04:12PM +0530, Karthik Ramanan wrote:
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> ---
>>>   .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>>> index f6c8660..7c5c565 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>>> @@ -1,6 +1,6 @@
>>>   DESCRIPTION = "Task to install wireless packages into the target FS"
>>>   LICENSE = "MIT"
>>> -PR = "r29"
>>> +PR = "r30"
>>>
>>>   inherit packagegroup
>>>
>>> @@ -63,6 +63,13 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
>>>       ${FIRMWARE_AND_DRIVERS} \
>>>   "
>>>
>>> +CONNECTIVITY_RDEPENDS_omap-a15 = "\
>>> +    ${WLAN_COMMON} \
>>> +    ${BLUETOOTH_STACK} \
>>> +    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
>>> +    bt-firmware \
>>
>> So, I see that wlan and by components are added to omap-a15 SOC, while
>> firmware and drivers are only enabled when built for GLSDK. I'm wondering if
>> that will affect negatively other platforms based on the same SOC, including
>> am57x... And wasn't BT support completely dropped by Sitara? Is it still the
>> case?
>
> Ping on this one - this will re-enable BT for the entire SOC family, that will
> affect DRA7xx as well AM57x. I'm not sure that is intended for other SDK
> products. Should those be conditional on ARAGO_BRAND set to glsdk as well?
>

I will take Yaniv's help here because I am not aware of what is required 
for the other SoC families.

Yaniv,

If you recall, during the previous GLSDK releases we made this change as 
conditional to GLSDK. There was also a check for amsdk.

Here is the link to the older version of this file:
http://arago-project.org/git/projects/meta-arago-glsdk.git?p=projects/meta-arago-glsdk.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb;h=00460683ce31ba5c32c60b94fc4aa94ed11b682b;hb=a0c23900703dd66bf28760cbdaf6bdec97c9bd72

Would you be able to comment/suggest on what is needed here?

Regards
Karthik


>
>>> +"
>>> +
>>>   RDEPENDS_${PN} = "\
>>>       ${CONNECTIVITY_RDEPENDS} \
>>>   "
>>> --
>>> 2.0.1
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


