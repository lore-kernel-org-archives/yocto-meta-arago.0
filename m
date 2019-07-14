Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by arago-project.org (Postfix) with ESMTPS id 1AFD252972
	for <meta-arago@arago-project.org>;
	Sun, 14 Jul 2019 00:08:51 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id v24so12712613ljg.13
	for <meta-arago@arago-project.org>;
	Sat, 13 Jul 2019 17:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DEXYll4E0CIHaeTkPuCQA2D3hmc1oTcMwMpCV6LC7GM=;
	b=UPIadijK7C4Oj78pTdsZ+HzT4mpn0QjEqE3J3KKoiu2t86iPrajxmgYc6+oIOq+fiB
	yNeBJQFfvmDyvnLYrvTh3hci2iJeKlpwlIRyuofCoGLjX++QBwhYnoDRad290XFjYOk1
	LIEdd4Zk/+h2F7L/nsvfpszKJAAoYbcsZ6QztgTK72MmWWDX4YpSGQD/hcrIbLjjCpbp
	vNEYN/SUm1W19cve7tci/Tobey0xzkZk4q45cUAALJNNOpxBCIYMIo89aWgCeT5JFppk
	W7Qeovr4yvFlx5t54ryi1/KL+83VLvZuU/PQxl2wT/NWS4rGXM4X0Sep2AjBzjrzvHW0
	EykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DEXYll4E0CIHaeTkPuCQA2D3hmc1oTcMwMpCV6LC7GM=;
	b=t08OZvJYEFqt/ZLSg33qkNrf/B0ZcqvVpOPfLoqlOAuPgx+AL7VemmQ0hrHx+BPXk2
	95ZT51DhgsCEwseGyqS0To8tNMwVcj7Oj3fG2Zi/dNAsgd6g+xfGTkH2urjrX+zRHahD
	YTwOqGjFUy8jvTmVGVEdylPvFNbTMt5TRFWTbnrYrvkbQEOS71Zwjb4tw1mzMJr9rHua
	lgLuR3HIOIktUyUDuUPoCJJ108Vtu/hlAX2OyLgYheSvB0/g8Z7amFoIkbRRemsDtvhB
	cagoaQcco8vaKKwaq/3cK0X+8AhSZGGdjeuFNUi161/0EXn09IJTMk6pg+lledtIdM/j
	20WA==
X-Gm-Message-State: APjAAAW/I1wKmU2EQhWrIerI6LWV0FodIqDxQp9t/iV2zF8VW/KIuxI2
	mLPiUpaCin9fn1mc8L6L8po7UbvH1Dtr7oKozw8VFOlq
X-Google-Smtp-Source: APXvYqwr+1Y19Q4B8aF6TuyRpp13qK8MGlRNhHvk5xTaIhC4oeP6wggL/NDWgNuiXeQK/ahFhWVa17L/M6wX8Meezl4=
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr9819627ljj.68.1563062881300;
	Sat, 13 Jul 2019 17:08:01 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 14 Jul 2019 12:07:50 +1200
Message-ID: <CADySD0F=GohTdO7HQJvOgFhW2zTfChCHrYwR2KRWSRQpU4bZnw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: qtbase patch task warning in thud branch
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
X-List-Received-Date: Sun, 14 Jul 2019 00:08:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

When building qtbase for am335x-evm in thud branch, this warning is comes:

WARNING: qtbase-5.11.3+gitAUTOINC+08de243eaa-r0.arago16 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
patching file examples/widgets/animation/animatedtiles/animatedtiles.qrc
patching file examples/widgets/animation/animatedtiles/main.cpp
Hunk #1 succeeded at 109 (offset 12 lines).
Hunk #2 succeeded at 139 with fuzz 2 (offset 12 lines).
Hunk #3 succeeded at 175 (offset 12 lines).
Hunk #4 succeeded at 260 with fuzz 1 (offset 12 lines).

Now at patch 0002-animatedtiles-Add-exit-button-for-non-window-environ.patch

Is there a new patch with a fix?

Thanks
Ankur

