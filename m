Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4F9B552007
	for <meta-arago@arago-project.org>;
	Thu, 11 Sep 2014 22:43:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8BMhscd011490;
	Thu, 11 Sep 2014 17:43:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8BMhsiY001937;
	Thu, 11 Sep 2014 17:43:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 11 Sep 2014 17:43:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8BMhrdE022496;
	Thu, 11 Sep 2014 17:43:53 -0500
Date: Thu, 11 Sep 2014 18:43:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>
Message-ID: <20140911224352.GM18620@edge>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD86C6135@MSXBEBVT12.planar.net>
MIME-Version: 1.0
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD86C6135@MSXBEBVT12.planar.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: I'm confused about distributions, machines, and images
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
X-List-Received-Date: Thu, 11 Sep 2014 22:44:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Matt,

Sorry for the delay - unfortunately, your questions were too generic and there 
was no simple answer to them...


On Fri, Aug 29, 2014 at 05:31:02PM -0700, Matt Schuckmann wrote:
> I feel like I keep going around in circles on this and I'm looking for some 
> wisdom and direction. I hope that I am posting this in the correct place.
> 
> I'm trying to get a Linux image setup for my custom board based on the AM335x.
> I assume that I want to use the meta-arago layer because it has all the 
> latest tested stuff. Correct?

Well, meta-ti as a BSP layer, while meta-arago is a Distro layer. You should 
probably start with a basic BSP first.


> Our board will not have any sound, screen, usbgadget, or video support so I 
> assume that I'll want to create a new MACHINE, probably based on 
> meta-arago/meta-arago-distro/conf/machine/arago-armv7.conf (correct?) but 

Incorrect. Per above, meta-ti is the BSP layer that defines all the machines, 
such as am335x-evm one, while meta-arago doesn't define any machines. Those 
arago-armv7 and arago-armv5 files in meta-arago are not the actual machines 
and are used for special purposes.


> with a different definition for MACHINE_FEATURES. Is this the correct thing 
> to do? Do I start with a completely scratch machine definition coping bits 
> and pieces from the arago machine definitions, or do somehow inherit or 
> include the definitions from the arago files and somehow override or filter 
> out stuff that I don't want?
> 
> Next, I don't understand if I need to create a new distribution. It doesn't 

Distribution is something that defines all the software components that you 
use in a system. You can start with one of the existing distributions, such as 
Poky, or Arago, or even Angstrom. There are some ways to do simple 
customizations in the existing distros, if all you want is to add few 
additional components. You only need your own distro if you are looking into 
completely redefining the system and it's behavior.


> seem like I should, but I can see that 
> meta-argo/meta-argo-distro/conf/distro/arago.conf defines DISTRO_FEATURES to 
> include many things that my system won't need, including alsa, pcmcia, 
> usbgadget, wifi, etc. I can't seem to find a complete description for what 
> DISTRO_FEATURES does (same goes for MACHINE_FEATURES and IMAGE_FEATURES), 
> does it mean that all of the things listed will be included in images based 
> on the distribution or? Ultimately the question is: do I need to create a 
> new distribution? And if I do how best to go about it.

You should probably read the Yocto Project documentation.


> Finally, I think that I need to create a new image that only includes the 
> packages that I want, I would think that I would want to base it on one of 
> the arago images (i.e. include something like arago-base-image.bb in my 
> image). However when I look at arago-base-image.bb I see that it includes 
> packagegroup-arago-base which RDEPENDS on alsa-lib and alsa-utils-aplay both 
> of which I don't think are needed since my board doesn't support sound. Does 
> this mean that I shouldn't base my image on an arago-base-image or is there 
> a way to filter these packages out?

There are ways to filter out packages, but only you can determine if it's 
easier than creating a completely new image.


> I really appreciate any help, and I really need some direction, I feel like 
> I'm starting to learn how to get around the open-embedded stack but there is 
> still a lot that I have to learn.

As I said above, your questions are way too generic and the best answer would 
be to point you to a corresponding documentation...

-- 
Denys

