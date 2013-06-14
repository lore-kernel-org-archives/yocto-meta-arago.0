Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2547C52A6D
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2013 16:31:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5EGVrfo010645;
	Fri, 14 Jun 2013 11:31:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5EGVrYH003293;
	Fri, 14 Jun 2013 11:31:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 14 Jun 2013 11:31:52 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5EGVq0l017731;
	Fri, 14 Jun 2013 11:31:53 -0500
Date: Fri, 14 Jun 2013 12:31:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>
Message-ID: <20130614163152.GA7791@edge>
References: <20130613165457.GS3741@edge>
	<CA+edY+RB9HN0JsPJecU1MNO1-5biRUNFqiEW82_q+ztJDtXe7A@mail.gmail.com>
	<20130613190647.GW3741@edge>
	<CA+edY+S1cuYX1c7XJU5K13mRUXcNu+XcL7KsEPFOTSCKA7kn0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+edY+S1cuYX1c7XJU5K13mRUXcNu+XcL7KsEPFOTSCKA7kn0g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Updated Core TI-SDK setup and build instructions
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
X-List-Received-Date: Fri, 14 Jun 2013 16:31:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 14, 2013 at 09:27:18AM -0700, Paul Kovitz wrote:
> I see the metadata file revisions are locked down. Still I have questions.
> 
> I ran the oe-layertool-setup.sh script but still there are recipes, the
> ltp-ddt .bbappend files in
> sources/meta-arago/meta-arago-distro/recipes-devtools/ltp-ddt, that have
> SRCREV = "{AUTOREV}".
> 
> I expected the automatically generated local.conf to contain something like
> SRCREV_pn-ltp-ddt = "70e324b8352e817485cc5e6865341c1a40118f78" (or some
> such SHA1) so I know I build the same ltp-ddt that was used to generate the
> SDK.

Yes, ltp-ddt is still AUTOREV-ed, unfortunately. But it is a test tool anyway 
and should not be part of the production system... We should probably look 
into pinning it as well for the releases - all other packages are pinned, as 
far as I know.


> Did I miss a step? Is there a configuration file somewhere else I did not
> find? To get the sources for the bitbake metadata, I ran
> 
> git clone git://arago-project.org/git/projects/oe-layersetup.git amsdk
> cd amsdk
> /oe-layertool-setup.sh -f configs/amsdk/amsdk-05.07.00.00-config.txt
> 
> Also, in meta-arago-extras/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_r5.00.18.bb,
> meta-arago-extras/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_r5.sp4.01.bb,
> meta-arago-extras/recipes-bsp/ti-compat-wireless/
> ti-compat-wireless-wl12xx_r5.sp4.01.bb and
> meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bbthere
> are SRCREV = "git tag" instead of a SHA1. This makes it harder to
> make a local source mirror. Would it be possible in the future releases to
> use the SHA1 and have a comment explaining the tag?

You mean this commit from last month?

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=451145b70e1fd922d99ae98041d9801008b6d5bf

-- 
Denys

