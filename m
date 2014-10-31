Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A95E452981
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 17:12:47 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VHCj7T027038
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 12:12:46 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VHChuF008626
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 22:42:44 +0530
Received: from [172.22.217.71] (172.22.217.71) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 31 Oct 2014 22:42:42 +0530
Message-ID: <5453C309.1070307@ti.com>
Date: Fri, 31 Oct 2014 22:42:41 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1414770194-24178-1-git-send-email-a0393906@ti.com>
	<1414770194-24178-5-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C75CCD7@DFLE08.ent.ti.com>
	<5453B65D.502@ti.com> <20141031165926.GJ25408@edge>
In-Reply-To: <20141031165926.GJ25408@edge>
X-Originating-IP: [172.22.217.71]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>, "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [for master v3 4/4] weston: v1.3.0 for DRM based backend (additional patches)
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
X-List-Received-Date: Fri, 31 Oct 2014 17:12:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 31-Oct-14 10:29 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 31, 2014 at 09:48:37PM +0530, Karthik Ramanan wrote:
>> On 31-Oct-14 9:38 PM, Cooper Jr., Franklin wrote:
>>>>   inherit autotools pkgconfig useradd
>>>>
>>>>   DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
>>>> -DEPENDS += "wayland virtual/mesa virtual/egl pango"
>>>> +DEPENDS += "wayland libgbm virtual/egl pango"
>>>> +
>>>> +COMPATIBLE_MACHINE = "dra7xx-evm"
>
>>> [Franklin] Can all of this work on am57x? If so can we add that machine to
>>> the compatible field or maybe set this to the generic SOC family?
>>
>> Franklin,
>>
>> Potentially yes, but note that the kernel needs to have all the
>> patches for the DRM module for everything to work. So I have very
>> conservatively set the compatible machine to dra7xx-evm for moment.
>>
>> I also had a look at the x15 board today and it seems like the multiple
>> display support is not present on x15 (correct?). So you may only
>> need a subset of the patches here.
>>
>> In a few weeks, I will try to bring up the weston 1.6.0 with the DRM
>> backend. At that point of time we can remove this and may be that
>> might be more suited for am57xx.
>
> Karthik,
>
> That would be great if we could consolidate on a single version of Wayland and
> Weston! Please let me know if you need any help with that.
>
Denys,

That's the final objective. We going to start working towards that.
As you understand that the kernel dependency needs to be sorted out 
before that.

If there is no other feedback on this patch, it would be good to have 
this merged to the daisy as an interim. When we do add support for DRM 
backend on 1.6.0, I will take action to remove support for 1.3.0.

For those how want to use this version can set the preferred_provider to 
this version.

Regards
Karthik

