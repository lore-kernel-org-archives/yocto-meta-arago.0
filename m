Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5514452A19
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 18:19:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7CIJk70008102
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 13:19:46 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CIJkSA021425
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 13:19:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 12 Aug 2015 13:19:46 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CIJjbE003410;
	Wed, 12 Aug 2015 13:19:46 -0500
Message-ID: <55CB8E42.7020507@ti.com>
Date: Wed, 12 Aug 2015 14:19:46 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <1438704182-21056-1-git-send-email-j-stiffler@ti.com>
	<E60A9E1B4132A24DB80BD56ABC926847350B525E@DBDE04.ent.ti.com>
	<20150810170043.GC30560@edge>
In-Reply-To: <20150810170043.GC30560@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config for ti-vip and ti-vpe
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
X-List-Received-Date: Wed, 12 Aug 2015 18:19:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/10/2015 1:00 PM, Denys Dmytriyenko wrote:
> On Wed, Aug 05, 2015 at 09:55:57AM +0000, Devshatwar, Nikhil wrote:
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
>>> Sent: Tuesday, August 04, 2015 9:33 PM
>>> To: meta-arago@arago-project.org
>>> Subject: [meta-arago] [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config
>>> for ti-vip and ti-vpe
>>>
>>> * The module ti-vip and ti-vpe will use the device node /dev/video0
>>>    and /dev/video1
>>> * Which module gets which device node depends on the order they are
>>>    inserted.
>>> * The vpe gstreamer plugin has the assumption that ti-vpe is connected
>>>    to /dev/video0
>>> * This conf file will ensure that ti-vpe is inserted first, and gets
>>>    node /dev/video0
>>>
>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>> ---
>>>   .../gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf     |  1 +
>>>   .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 11 +++++++++--
>>>   2 files changed, 10 insertions(+), 2 deletions(-)  create mode 100644 meta-
>>> arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-
>>> video.conf
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-
>>> plugins-vpe/ti-video.conf b/meta-arago-extras/recipes-multimedia/gst-plugins-
>>> ti/gstreamer1.0-plugins-vpe/ti-video.conf
>>> new file mode 100644
>>> index 0000000..339a0c1
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-p
>>> +++ lugins-vpe/ti-video.conf
>>> @@ -0,0 +1 @@
>>> +install ti-vip /sbin/modprobe ti-vpe; /sbin/modprobe --ignore-install
>>> +ti-vip
>> This would work only if the VIP and VPE are compiled as modules
>> Also, it won't work with if the USB camera registers a video device.
>> The better way would be for plugin to not hard code the /dev/video0 device
>> If you want to hard code the device name, it better be /dev/v4l/by-path/<the vpe platform device name>
>> This won't change irrespective of other modules are there or not, and works
>> even in case VIP,VPE is compiled as builtin
> Jake,
>
> Do you plan to make changes suggested by Nikhil?
>

I am going to try to work with the source owners to get this fixed upstream.


