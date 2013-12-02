Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 545F652972
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 18:19:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2IJRH1003297
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 12:19:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2IJRxm019781
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 12:19:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Dec 2013 12:19:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2IJQdT015944;
	Mon, 2 Dec 2013 12:19:27 -0600
Date: Mon, 2 Dec 2013 13:19:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20131202181926.GJ690@edge>
References: <CF956B779D819D41BBC043B7082161D546DDE1@DBDE04.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E970669@DLEE08.ent.ti.com>
	<CF956B779D819D41BBC043B7082161D546E202@DBDE04.ent.ti.com>
	<20131202171057.GI690@edge>
	<CF956B779D819D41BBC043B7082161D546E236@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D546E236@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Header files missing in the image
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
X-List-Received-Date: Mon, 02 Dec 2013 18:19:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 02, 2013 at 12:35:58PM -0500, Hingolikar, Mrinmayee wrote:
> Hi Denys,
> 
> I am trying to understand why the release build is missing header files, 
> whereas the daily build has them. The image recipe is the same, however I 
> see many header files in the daily build image. I just wanted to know if 
> there is a setting in any conf or bbclass for the same that is causing 
> header files to be installed.

Mrinmayee,

Well, there are some distro-level image features that can enable installing 
all -dev or -dbg packages, but we don't set them in our Arago distro. Look for 
EXTRA_IMAGE_FEATURES and see if it contains "dev-pkgs" in it. It is useful to 
get a development version of the image, but we build a full devkit instead for 
our products, that contains toolchain, host tools and additional setup...

-- 
Denys


> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, December 02, 2013 10:41 PM
> > To: Hingolikar, Mrinmayee
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Header files missing in the image
> > 
> > On Mon, Dec 02, 2013 at 11:57:02AM -0500, Hingolikar, Mrinmayee wrote:
> > >    Thanks Denys.
> > >
> > >    What needs to be done for including headers?
> > 
> > Can you please explain what you are trying to do - maybe there's a
> > better approach? Are you really looking for the header files in the
> > rootfs? Generally it can be done by including necessary -dev packages,
> > but it's not recommended.
> > Are you trying to enable native compilation on the target?
> > 
> > --
> > Denys
> > 
> > 
> > >    From: Dmytriyenko, Denys
> > >    Sent: Monday, December 02, 2013 6:39 PM
> > >    To: meta-arago@arago-project.org; Hingolikar, Mrinmayee
> > >    Subject: RE: [meta-arago] Header files missing in the image
> > >
> > >
> > >
> > >    There should not be any headers on the rootfs by default, as it's
> > not
> > >    meant for development. That is what devkit is for.
> > >
> > >    Denys
> > >
> > >    -----Original Message-----
> > >    From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
> > >    Received: Sunday, 01 Dec 2013, 4:39
> > >    To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> > >    Subject: [meta-arago] Header files missing in the image
> > >
> > >    Hi all,
> > >
> > >
> > >
> > >    I have faced a strange issue during one of the builds. The
> > generated GLSDK
> > >    image has an empty /usr/include ie no .h files at all.
> > >
> > >    Is this due to any misconfiguration from my side?
> > >
> > >
> > >
> > >    Appreciate any help on this.
> > >
> > >
> > >
> > >    Thanks and Regards,
> > >
> > >    Mrinmayee
> > >
> > >

