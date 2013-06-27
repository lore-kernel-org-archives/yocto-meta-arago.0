Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C3B9852A68
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 03:26:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5R3Qiw3023618
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 22:26:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5R3Qi31025858
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 22:26:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 22:26:44 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5R3Qgd3016762;	Wed, 26 Jun 2013 22:26:43 -0500
Message-ID: <51CBB0F2.1040807@ti.com>
Date: Thu, 27 Jun 2013 08:56:42 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1372244789-11835-1-git-send-email-heroor@ti.com>
	<7D46E86EC0A8354091174257B2FED10159617484@DLEE11.ent.ti.com>
	<20130626135057.GE27031@edge> <20130626135230.GF27031@edge>
In-Reply-To: <20130626135230.GF27031@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH oe-layersetup] configs: Update glsdk 6.01.00 to	point to GLSDK staging trees
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
X-List-Received-Date: Thu, 27 Jun 2013 03:26:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/26/2013 7:22 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 26, 2013 at 09:50:57AM -0400, Denys Dmytriyenko wrote:
>> On Wed, Jun 26, 2013 at 12:56:29PM +0000, Maupin, Chase wrote:
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>> bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>>>> Sent: Wednesday, June 26, 2013 6:06 AM
>>>> To: meta-arago@arago-project.org
>>>> Subject: [meta-arago] [PATCH oe-layersetup] configs: Update glsdk
>>>> 6.01.00 to point to GLSDK staging trees
>>>>
>>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>>> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>>> ---
>>>> configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>>>> b/configs/glsdk/glsdk-06.01.00-config.txt
>>>> index 6159262..a4ada4c 100644
>>>> --- a/configs/glsdk/glsdk-06.01.00-config.txt
>>>> +++ b/configs/glsdk/glsdk-06.01.00-config.txt
>>>> @@ -2,9 +2,9 @@
>>>> # repo name,repo uri,repo branch,repo
>>>> commit[,layers=layer1:layer2...:layern]
>>>>
>>>> bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
>>>> -meta-arago,git://arago-project.org/git/meta-
>>>> arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
>>>> extras
>>>> +meta-arago,git://git.ti.com/glsdk/meta-
>>>> arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
>>>> extras
>>>
>>> I have some concern if you are already starting to branch to your own tree.  
>>> I hope we won't see a large divergence here.
>>>
>>> Also, maybe a nitpick but is there a reason you named your repo meta-arago 
>>> and meta-ti on git.ti.com?  I worry that this will cause confusion with the 
>>> true meta-arago and meta-ti on arago-project.org, particularly since you are 
>>> using the same tag name too.  Can you rename these like the AMSDK did?

Agreed. I'll rename the trees to follow the AMSDK model. I'll send V2
along today.

>>
>> I would agree here as well - hosting meta-ti and meta-arago clones on 
>> git.ti.com is very confusing regardless of the name and sets a bad precedent. 
>> I would be happy to give you your own trees on arago-project.org either in the 
>> personal area or in the projects area. That is how it is done with other 
>> Arago-based SDKs - AMSDK, MCSD, etc.
> 
> One little clarification - "your own trees for tagging purposes". As we 
> discussed, let's try to avoid forking as much as possible - please keep 
> upstreaming your changes.

This time around, we will submit patches to meta-arago and meta-ti ahead
of time. I have no intention of maintaining a fork.

Obviously, we want to learn from the past ;-)

> 
> 
>>>> meta-openembedded,git://git.openembedded.org/meta-
>>>> openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
>>>> =toolchain-layer:meta-oe
>>>> -meta-ti,git://arago-project.org/git/meta-
>>>> ti.git,danny,ti2013.04.02,layers=
>>>> +meta-ti,git://git.ti.com/glsdk/meta-
>>>> ti.git,danny,ti2013.04.02,layers=
>>>> meta-linaro,git://git.linaro.org/openembedded/meta-
>>>> linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
>>>> oe-core,git://git.openembedded.org/openembedded-
>>>> core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
>>>> OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>>> --
>>>> 1.7.0.4
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 


