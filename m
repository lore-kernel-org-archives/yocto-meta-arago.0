Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by arago-project.org (Postfix) with ESMTPS id F21BC52A3A
	for <meta-arago@arago-project.org>;
	Thu,  2 Nov 2017 13:49:20 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id t71so4825742ywc.3
	for <meta-arago@arago-project.org>;
	Thu, 02 Nov 2017 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=q/ya/a2wDDUlf+WhJyDpIVDOnOc9XaBNmjYu331fsh8=;
	b=X8wzCJbgm49HH/O9yYaXg0DYr2a5buBTHqbfon415pJPcygg2XvFVGS0Tw7kNvTjMn
	hF7+BRnFZqJqmVnbMcGekA/Z6qDZqyTshuZUX+TMse4/IKVvu/kpfwJoBAkoHSikjwBy
	AHgwoh6Bn5LuM/UxlEggmauryZHt5EWKDWk18DiDTwJSChMSLmkY79zHzZfmizjQC3X5
	ZUkbAbyGkmX5zi5yYCc25m51gVQefl2CtGy7klO23whhg6hUfQF/Pnaeq8h2MNRo54D4
	8nGqHWCUc1QqaPgR+18VEHZP6Hy7R4aMzeCU1rxuVfiVqSJ9uU3HNNcyk8OKDUN2aXiR
	6Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=q/ya/a2wDDUlf+WhJyDpIVDOnOc9XaBNmjYu331fsh8=;
	b=Xwcb1mB/sk0n0fw2jX5oa27YuQMhXSLJT+DtQf7P3k8Yd2Bnc0CcwSLw0BySTCTDp9
	fC28jjrQraaBVXHiS3SSZZvkrSOT2H6DFW1tp9cAJAxHemvmB0Tka4DzlgPn+mMRI+7y
	UnAhdhL8N0mJcmnZgGHI0bg71XAOa+cuXIb7/AFUQakBDxAuuZVmeg3xSCg/sDbCaH5h
	yaDvRNzhSFMVey+AZFEcUtQIZBaat+u0kOZN0PpkYfKyT42Zk39pSu6o4+teLglIVKdi
	lukXxg47VJJeipBIG3yLJA2xT0O/73Iy1LPfsLjCPR6oQ1Dd0RUr+AvpiHnaiILz1s/Q
	D7Gg==
X-Gm-Message-State: AMCzsaXQMUrSIlVVFUuk2h7CIaZbV2vnm43ppRhSnQ7vv66R2JiJYDUg
	j4rPWu1fqXorDrCguziEVPc3kcZOFqgVetjgiL8=
X-Google-Smtp-Source: ABhQp+QcVCUYhtIuIKPJ6CvtZl/XRDZcXE4/wA4vlPymG9EGIsmgXfzo90qajGMlzUd5HqADcpxUX9xyeIGhvxsfp8w=
X-Received: by 10.13.252.66 with SMTP id m63mr1991248ywf.293.1509630560853;
	Thu, 02 Nov 2017 06:49:20 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 02 Nov 2017 13:49:10 +0000
Message-ID: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Building Xwayland
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
X-List-Received-Date: Thu, 02 Nov 2017 13:49:21 -0000
Content-Type: multipart/alternative; boundary="94eb2c06ac48526426055d004186"

--94eb2c06ac48526426055d004186
Content-Type: text/plain; charset="UTF-8"

Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?

There is no "official" support for X11 in the TI SDK. Only Wayland is
present. I am hoping to run my X11 applications with Xwayland. I have
included x11 and wayland in DISTRO_FEATURES, but weston-xwayland /
xserver-xorg are refusing to build.

OE/meta has core-image-weston [0] which should build Xwayland as well but
it also fails at weston-xwayland / xserver-xorg.

I notice there is an experimental branch [1] but it removes Wayland
altogether and appears to be very experimental, so that is a no-go for me.

[0]
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?h=master
[1]
http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=shortlog;h=refs/heads/morty-x11-experimental

--94eb2c06ac48526426055d004186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Has anyone built Xwayland for Beagleboard X15 or AM57xx-EV=
M?<div><br></div><div>There is no &quot;official&quot; support for X11 in t=
he TI SDK. Only Wayland is present. I am hoping to run my X11 applications =
with Xwayland. I have included x11 and wayland in DISTRO_FEATURES, but west=
on-xwayland / xserver-xorg are refusing to build.=C2=A0</div><div><br></div=
><div>OE/meta has core-image-weston [0] which should build Xwayland as well=
 but it also fails at weston-xwayland / xserver-xorg.=C2=A0</div><div><br><=
/div><div>I notice there is an experimental branch [1] but it removes Wayla=
nd altogether and appears to be very experimental, so that is a no-go for m=
e.</div><div><br></div><div>[0]=C2=A0<a href=3D"http://cgit.openembedded.or=
g/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?=
h=3Dmaster">http://cgit.openembedded.org/openembedded-core/tree/meta/recipe=
s-graphics/images/core-image-weston.bb?h=3Dmaster</a></div><div>[1]=C2=A0<a=
 href=3D"http://arago-project.org/git/projects/?p=3Dmeta-processor-sdk.git;=
a=3Dshortlog;h=3Drefs/heads/morty-x11-experimental">http://arago-project.or=
g/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dshortlog;h=3Drefs/heads/mort=
y-x11-experimental</a></div><div><br></div></div>

--94eb2c06ac48526426055d004186--
