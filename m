Return-Path: <btv1==335dcc7ca33==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 56CEB52972
	for <meta-arago@arago-project.org>;
	Mon, 15 Sep 2014 18:15:14 +0000 (UTC)
X-ASG-Debug-ID: 1410804910-04b02b738333cae0001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id Hnzpkyr7TLwtxxAK for <meta-arago@arago-project.org>;
	Mon, 15 Sep 2014 11:15:10 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Mon, 15 Sep 2014 11:15:10 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Mon, 15 Sep 2014 11:15:09 -0700
Thread-Topic: [meta-arago] I'm confused about distributions, machines, and
	images
X-ASG-Orig-Subj: RE: [meta-arago] I'm confused about distributions, machines,
	and images
Thread-Index: Ac/OEeEZn9oBOg0VRQaGgtBsEiA6CAC+HI1g
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8727C52@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD86C6135@MSXBEBVT12.planar.net>
	<20140911224352.GM18620@edge>
In-Reply-To: <20140911224352.GM18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1410804910
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0001 1.0000 -2.0204
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
	SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.9517
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
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
X-List-Received-Date: Mon, 15 Sep 2014 18:15:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Deny's=20

Thank you very much for the reply, I'm sorry that you find my questions too=
 generic, as a new user generic is often where you start. I tried to focus =
on the IMAGE, DISTRIBUTION and MACHINE aspects and pose specific questions =
on what I should do. Try to think about my questions from the perspective o=
f a new user with the task I outlined. I know that there are a lot of thing=
s that can be done but what would you as an expert do?=20

For instance given that it's a custom board with no sound, display, or atta=
ched UI would you use the Arago, Anstrom, or Poky distributions directly? T=
hey all seem like over kill to me.=20


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, September 11, 2014 3:44 PM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] I'm confused about distributions, machines,
> and images
>=20
> Matt,
>=20
> Sorry for the delay - unfortunately, your questions were too generic
> and there was no simple answer to them...
>=20
>=20
> On Fri, Aug 29, 2014 at 05:31:02PM -0700, Matt Schuckmann wrote:
> > I feel like I keep going around in circles on this and I'm looking
> for some
> > wisdom and direction. I hope that I am posting this in the correct
> place.
> >
> > I'm trying to get a Linux image setup for my custom board based on
> the AM335x.
> > I assume that I want to use the meta-arago layer because it has all
> the
> > latest tested stuff. Correct?
>=20
> Well, meta-ti as a BSP layer, while meta-arago is a Distro layer. You
> should
> probably start with a basic BSP first.

By "start with a basic BSP first" do you mean defining a new BSP layer?=20
Does this include defining a new MACHINE type? Do I somehow inherit and ove=
rride from the stuff in the meta-ti layer or do I just copy and edit to cre=
ate my own?=20

>=20
>=20
> > Our board will not have any sound, screen, usbgadget, or video
> support so I
> > assume that I'll want to create a new MACHINE, probably based on
> > meta-arago/meta-arago-distro/conf/machine/arago-armv7.conf (correct?)
> but
>=20
> Incorrect. Per above, meta-ti is the BSP layer that defines all the
> machines,
> such as am335x-evm one, while meta-arago doesn't define any machines.
> Those
> arago-armv7 and arago-armv5 files in meta-arago are not the actual
> machines
> and are used for special purposes.
>=20

Yes I realized my mistake shortly after posting the post. It is very confus=
ing to someone just learning a system to have dummy files like this with no=
 comments identifying them as such.=20

>=20
> > with a different definition for MACHINE_FEATURES. Is this the correct
> thing
> > to do? Do I start with a completely scratch machine definition coping
> bits
> > and pieces from the arago machine definitions, or do somehow inherit
> or
> > include the definitions from the arago files and somehow override or
> filter
> > out stuff that I don't want?
> >
> > Next, I don't understand if I need to create a new distribution. It
> doesn't
>=20
> Distribution is something that defines all the software components that
> you
> use in a system. You can start with one of the existing distributions,
> such as
> Poky, or Arago, or even Angstrom. There are some ways to do simple
> customizations in the existing distros, if all you want is to add few
> additional components. You only need your own distro if you are looking
> into
> completely redefining the system and it's behavior.

I don't know really know what the differences between Poky, Arago, and Angs=
trom are or even what their respective intended behavior is so it is diffic=
ult to determine what should be done. Is there anything that compares and c=
ontrasts them in a way that can help one see the differences and decide?=20
In general they all "seem" to include a fairly complete system including gr=
aphics, sound, USB, etc. As I said my system won't have much of this.

>=20
>=20
> > seem like I should, but I can see that
> > meta-argo/meta-argo-distro/conf/distro/arago.conf defines
> DISTRO_FEATURES to
> > include many things that my system won't need, including alsa,
> pcmcia,
> > usbgadget, wifi, etc. I can't seem to find a complete description for
> what
> > DISTRO_FEATURES does (same goes for MACHINE_FEATURES and
> IMAGE_FEATURES),
> > does it mean that all of the things listed will be included in images
> based
> > on the distribution or? Ultimately the question is: do I need to
> create a
> > new distribution? And if I do how best to go about it.
>=20
> You should probably read the Yocto Project documentation.
>=20

I've read "a lot" of documentation for the Yocto Project and otherwise and =
I still have questions. I understand that you understand the system and tha=
t you think the documentation is relatively complete but as new user there =
is a lot left out.=20
How about a concrete example of how one would remove a feature (lets say AL=
SA) from all of these?
How about a concrete example of the impact of adding a feature to any one o=
f these?=20
Why is there so much overlap in the features that can be specified in DISTO=
_FEATURES and MACHINE_FEATURES?=20

>=20
> > Finally, I think that I need to create a new image that only includes
> the
> > packages that I want, I would think that I would want to base it on
> one of
> > the arago images (i.e. include something like arago-base-image.bb in
> my
> > image). However when I look at arago-base-image.bb I see that it
> includes
> > packagegroup-arago-base which RDEPENDS on alsa-lib and alsa-utils-
> aplay both
> > of which I don't think are needed since my board doesn't support
> sound. Does
> > this mean that I shouldn't base my image on an arago-base-image or is
> there
> > a way to filter these packages out?
>=20
> There are ways to filter out packages, but only you can determine if
> it's
> easier than creating a completely new image.

Can you tell me about some of those ways to filter things out of packages? =
Or point me to specific places in the documentation.
How about how to remove things from RDEPENDS?

>=20
>=20
> > I really appreciate any help, and I really need some direction, I
> feel like
> > I'm starting to learn how to get around the open-embedded stack but
> there is
> > still a lot that I have to learn.
>=20
> As I said above, your questions are way too generic and the best answer
> would
> be to point you to a corresponding documentation...
>=20
> --
> Denys

