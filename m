Return-Path: <paul.kovitz@welchallyn.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by arago-project.org (Postfix) with ESMTPS id 97D43529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 01:15:56 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id xa7so5807343pbc.28
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 17:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Jk/hSq97xAc7j0Pi+AzR1zxqzFAKSIexORZvP1Yaw8E=;
	b=JL+u1SSUHYYssp+JjzXiN7WvR7RcCUzKTJw/pyYyJ5Obis7DwdiXRHtCcMtjM2pxIe
	Izz1RLF3Aod8jnUzsv9/F97AJWL9N3iaR+hkDjDM9+yFF9W26VI4TZ2G7UY+7U38M4Fl
	K2wS3ZlfVCU9R6UoHpabW+uy2KA6dCYJSmSLObOMgbSytow9Suzs8jhwlsbEg5qgqVx1
	KypVGWn6b+D3qfHSnQFbbOtifWQpVjI4C/GDozFkRDH28q8b4n9epvoMzxQGuVG/Z2kg
	pWCftYtR8l13F3MYFsSwsa54qpoZ8gDCV9S0nErzVSIarn6x6IbxLS3UvFtKwk/hdvIP
	lLBQ==
X-Received: by 10.66.76.194 with SMTP id m2mr9556439paw.14.1359076554965; Thu,
	24 Jan 2013 17:15:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.73.106 with HTTP; Thu, 24 Jan 2013 17:15:14 -0800 (PST)
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Thu, 24 Jan 2013 17:15:14 -0800
Message-ID: <CA+edY+Tw5JtFgevWy8hWNA7wH8ykuKV=W4Eq1yqo1Vq0jMtyLw@mail.gmail.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
X-Gm-Message-State: ALoCoQlNJNBihiwKZhHib3BbbFRL4Szvr5BfbhtSmJZALR3Q27oePd0vOtzKQo3U6LBGul+i8wn0
Subject: newbie question: license.manifest vs. package.manifest vs. opkg list
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
X-List-Received-Date: Fri, 25 Jan 2013 01:15:57 -0000
Content-Type: multipart/alternative; boundary=f46d042fdb5c48045304d412abf1

--f46d042fdb5c48045304d412abf1
Content-Type: text/plain; charset=ISO-8859-1

I am using the 05.06.00.00 baseline. I have an image recipe that I created
by removing some packages from tisdk-rootfs-image.bb, changing the
ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to qt4-embedded and making
edits to task-arago-tisdk-graphics.bb and task-arago-tisdk-matrix.bb to not
use packages that rely on opengl-es to run. The image worked as expected on
the target hardware for the tests I ran.

I wanted to understand the licenses this build used, so I looked
in build/arago-tmp-external-arago-toolchain/deploy/licenses/[my new image
name] and saw the license.manifest and package.manifest files. To verify
package.manifest, I looked at the packages the target displayed as a result
of opkg list and compared the output package.manifest. The opkg list
command listed two packages that are not in package.manifest. The other 288
package names match exactly. The same build has 69 more  package names in
package.manifest than there are in license.manaifest. The other 219 package
names match exactly.

I thought I must have done something wrong, so I built base-arago-image
from the 05.06.00.00 release and looked at the
arago-tmp-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-20130124231158
directory. There are 11 more package names in package.manifest than there
are in license.manifest. The other 40 names match exactly.

Am I doing something wrong, or is this expected behavior, or perhaps both?
Thanks in advance for the help.

-- 
Paul Kovitz

--f46d042fdb5c48045304d412abf1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I am using the 05.06.00.00 baseline. I have an i=
mage recipe that I created by removing some packages from <a href=3D"http:/=
/tisdk-rootfs-image.bb" target=3D"_blank">tisdk-rootfs-image.bb</a>, changi=
ng the ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to qt4-embedded and =
making edits to <a href=3D"http://task-arago-tisdk-graphics.bb" target=3D"_=
blank">task-arago-tisdk-graphics.bb</a> and <a href=3D"http://task-arago-ti=
sdk-matrix.bb" target=3D"_blank">task-arago-tisdk-matrix.bb</a> to not use =
packages that rely on opengl-es to run. The image worked as expected on the=
 target hardware for the tests I ran.=A0</div>


<div><br></div><div>I wanted to understand the licenses this build used, so=
 I looked in=A0build/arago-tmp-external-arago-toolchain/deploy/licenses/[my=
 new image name] and saw the license.manifest and package.manifest files. T=
o verify package.manifest, I looked at the packages the target displayed as=
 a result of opkg list and compared the output package.manifest. The opkg l=
ist command listed two packages that are not in package.manifest. The other=
 288 package names match exactly. The same build has 69 more =A0package nam=
es in package.manifest than there are in license.manaifest. The other 219 p=
ackage names match exactly.</div>


</div><div><br></div><div>I thought I must have done something wrong, so I =
built base-arago-image from the 05.06.00.00 release and looked at the arago=
-tmp-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-2=
0130124231158 directory. There are 11 more package names in package.manifes=
t than there are in license.manifest. The other 40 names match exactly.<br>


</div><div><div><br></div><div>Am I doing something wrong, or is this expec=
ted behavior, or perhaps both? Thanks in advance for the help.</div><div><b=
r></div>-- <br>Paul Kovitz<div><br></div>
</div></div>

--f46d042fdb5c48045304d412abf1--
