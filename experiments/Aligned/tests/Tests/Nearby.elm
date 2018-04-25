module Tests.Nearby exposing (view)

{-| Testing nearby elements such as those defined with `above`, `below`, etc.
-}

import Color exposing (..)
import Html
import Testable
import Testable.Element exposing (..)
import Testable.Element.Background as Background
import Testable.Element.Font as Font
import Testable.Runner


box attrs =
    el
        ([ width (px 50)
         , height (px 50)
         , Background.color blue
         ]
            ++ attrs
        )
        empty


{-| -}
main : Html.Html msg
main =
    Testable.Runner.show view


{-| -}
view : Testable.Element msg
view =
    let
        transparentBox attrs =
            el
                ([ Font.color white
                 , width (px 50)
                 , height (px 50)
                 , Background.color (rgba 52 101 164 0.8)
                 ]
                    ++ attrs
                )
                (text "hi")

        single location name box =
            row [ height (px 100), width fill, spacing 50 ]
                [ box
                    [ location
                        (el
                            [ width (px 20)
                            , height (px 20)
                            , Background.color darkCharcoal
                            ]
                            empty
                        )
                    ]
                , box
                    [ location
                        (el
                            [ width (px 20)
                            , height (px 20)
                            , alignLeft
                            , Background.color darkCharcoal
                            ]
                            empty
                        )
                    ]
                ]

        nearby location name box =
            column [ spacing 32, label "column" ]
                [ text name
                , row [ height (px 100), width fill, spacing 50 ]
                    [ box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , alignLeft
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , alignRight
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , alignTop
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , alignBottom
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height (px 20)
                                , centerY
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    ]
                , text "widths/heights"
                , row [ height (px 100), width fill, spacing 50, label "Row" ]
                    [ box
                        [ location
                            (el
                                [ label name
                                , width fill
                                , height fill
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height fill
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ label "box"
                        , location
                            (el
                                [ label name
                                , width fill
                                , height (px 20)
                                , Background.color darkCharcoal
                                ]
                                empty
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width (px 20)
                                , height shrink
                                , Background.color darkCharcoal
                                , Font.color white
                                ]
                                (text "h-shrink")
                            )
                        ]
                    , box
                        [ location
                            (el
                                [ label name
                                , width shrink
                                , height (px 20)
                                , Background.color darkCharcoal
                                , Font.color white
                                ]
                                (text "w-shrink")
                            )
                        ]
                    ]
                ]
    in
    column
        [ centerX, label "Nearby Elements" ]
        [ nearby above "above" box
        , nearby below "below" box
        , nearby inFront "inFront" box
        , nearby onRight "onRight" box
        , nearby onLeft "onLeft" box
        , nearby behind "behind" transparentBox
        ]