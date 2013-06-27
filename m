Return-Path: <heroor@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 88B9F529B0
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 14:33:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5REXgPl024515
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:33:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5REXgCY015964
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:33:42 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:33:42 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5REXeRa008180;	Thu, 27 Jun 2013 09:33:41 -0500
Message-ID: <51CC4D43.1000109@ti.com>
Date: Thu, 27 Jun 2013 20:03:39 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1372308234-6315-1-git-send-email-heroor@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961B784@DLEE11.ent.ti.com>
	<20130627142610.GL28379@edge>
In-Reply-To: <20130627142610.GL28379@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 oe-layersetup] configs: Update glsdk 6.01.00 to point to GLSDK staging trees
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
X-List-Received-Date: Thu, 27 Jun 2013 14:33:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/27/2013 7:56 PM, Denys Dmytriyenko wrote:
> Any particular reason for hosting those trees on git.ti.com instead of 
> arago-project.org? When we were finalizing the policies for git.ti.com, the 
> agreement was to keep all the Arago-related repos on arago-project.org...

I didn't know the policies for git.ti.com? Any documentation on the
agreements? ;-)

In anycase, if you could create repositories for us in
arago-project.org, then I will start using them. Mrinmayee would be the
primary owner and I'm more a backup till she get's upto speed.

We'll send you the SSH keys in a separate email.

> 
> 
> On Thu, Jun 27, 2013 at 12:05:40PM +0000, Maupin, Chase wrote:
>> Acked-by: Chase Maupin <chase.maupin@ti.com>
>>
>> Thanks for changing the name.
>>
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>>> Sent: Wednesday, June 26, 2013 11:44 PM
>>> To: meta-arago@arago-project.org
>>> Subject: [meta-arago] [PATCHv2 oe-layersetup] configs: Update
>>> glsdk 6.01.00 to point to GLSDK staging trees
>>>
>>> * Follow the AMSDK model of having staging trees to tag releases.
>>> * GLSDK meta-ti staging tree is hosted at
>>>  git://git.ti.com/glsdk/meta-ti-glsdk.git
>>> * GLSDK meta-arago staging tree is hosted at
>>>  git://git.ti.com/glsdk/meta-arago-glsdk.git
>>>
>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>> ---
>>> configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>>> b/configs/glsdk/glsdk-06.01.00-config.txt
>>> index 6159262..47915ad 100644
>>> --- a/configs/glsdk/glsdk-06.01.00-config.txt
>>> +++ b/configs/glsdk/glsdk-06.01.00-config.txt
>>> @@ -2,9 +2,9 @@
>>> # repo name,repo uri,repo branch,repo
>>> commit[,layers=layer1:layer2...:layern]
>>>
>>> bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
>>> -meta-arago,git://arago-project.org/git/meta-
>>> arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
>>> extras
>>> +meta-arago,git://git.ti.com/glsdk/meta-arago-
>>> glsdk.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
>>> extras
>>> meta-openembedded,git://git.openembedded.org/meta-
>>> openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
>>> =toolchain-layer:meta-oe
>>> -meta-ti,git://arago-project.org/git/meta-
>>> ti.git,danny,ti2013.04.02,layers=
>>> +meta-ti,git://git.ti.com/glsdk/meta-ti-
>>> glsdk.git,danny,ti2013.04.02,layers=
>>> meta-linaro,git://git.linaro.org/openembedded/meta-
>>> linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
>>> oe-core,git://git.openembedded.org/openembedded-
>>> core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
>>> OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>> --
>>> 1.7.0.4
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


